//
//  RemoteStocksFeedServiceTests.swift
//  
//
//  Created by Tak Mazarura on 03/04/2022.
//

import XCTest
import CoreTesting
import CoreNetworking
import MockNetworking
@testable import StocksFeedFeature

final class RemoteStocksFeedServiceTests: RemoteStocksFeedServiceTest {}

// MARK: - Load Feed Failure Tests
extension RemoteStocksFeedServiceTests {
    func test_load_onSuccessWithNon200Code_returnsError() {
        let (sut, client) = make_sut()

        var returnedError: RemoteStocksFeedService.Error?
        let exp = expectation(description: "Wait for load completion")
        sut.load { result in
            switch result {
            case .success:
                XCTFail("Expected for Load to fail as StatusCode: 100 should result in a failure")
            case .failure(let error as RemoteStocksFeedService.Error):
                returnedError = error
                exp.fulfill()
            case .failure:
                XCTFail("Expected for Load to fail with RemoteStocksFeedService.Error.invalidResponse error")
            }
        }

        client.complete(withStatusCode: 100, data: .init())
        wait(for: [exp], timeout: 1.0)

        XCTAssertEqual(returnedError, .invalidResponse)
    }

    func test_load_onSuccessWithNonInvalidData_returnsError() {
        let (sut, client) = make_sut()

        var returnedError: RemoteStocksFeedService.Error?
        let exp = expectation(description: "Wait for load completion")
        sut.load { result in
            switch result {
            case .success:
                XCTFail("Expected for Load to fail as StatusCode: 100 should result in a failure")
            case .failure(let error as RemoteStocksFeedService.Error):
                returnedError = error
                exp.fulfill()
            case .failure:
                XCTFail("Expected for Load to fail with RemoteStocksFeedService.Error.invalidData error")
            }
        }

        client.complete(withStatusCode: 200, data: MockData.any_badJSONData())
        wait(for: [exp], timeout: 1.0)

        XCTAssertEqual(returnedError, .invalidData)
    }

    func test_load_onFailure_returnsError() {
        let (sut, client) = make_sut()

        var returnedError: Error?
        let exp = expectation(description: "Wait for load completion")
        sut.load { result in
            switch result {
            case .success:
                XCTFail("Expected for Load to fail as StatusCode: 100 should result in a failure")
            case .failure(let error):
                returnedError = error
                exp.fulfill()
            }
        }

        let clientError = NSError(domain: "Test", code: 0)
        client.complete(with: clientError)

        wait(for: [exp], timeout: 1.0)

        XCTAssertNotNil(returnedError)
    }
}

// MARK: - Load Feed Success Tests
extension RemoteStocksFeedServiceTests {
    func test_load_onSuccess_returnsStocks() {
        let (sut, client) = make_sut()

        var returnedStocks: [Stock] = []
        let exp = expectation(description: "Wait for load completion")
        sut.load { result in
            switch result {
            case .success(let stocks):
                returnedStocks = stocks
                exp.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }

        let data = MockData.any_data(for: MockData.FileName.stocksFeed.rawValue, fromBundle: Bundle.module)
        let expectedResponse = try! JSONDecoder().decode(TestRemoteStocksFeed.self, from: data)
        client.complete(withStatusCode: 200, data: data)
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(returnedStocks, expectedResponse.stocks.toModels())
    }
}

// MARK: - Make Sut
extension RemoteStocksFeedServiceTests {
    private func make_sut() -> (sut: RemoteStocksFeedService, client: HTTPClientSpy)  {
        let client = HTTPClientSpy()
        let sut = RemoteStocksFeedService(client: client)
        trackForMemoryLeaks(sut)
        return (sut, client)
    }
}


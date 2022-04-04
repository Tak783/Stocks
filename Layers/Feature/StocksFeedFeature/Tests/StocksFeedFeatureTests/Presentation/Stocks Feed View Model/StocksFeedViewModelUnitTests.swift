//
//  StocksFeedViewModelUnitTests.swift
//  
//
//  Created by Tak Mazarura on 04/04/2022.
//

import XCTest
import CoreTesting
import CoreFoundational
import CoreNetworking
import MockNetworking
@testable import StocksFeedFeature

final class StocksFeedViewModelUnitTests {}

extension StocksFeedViewModelUnitTests {
    func test_init_setsInitialVariablesCorrectly() {
        let title = "Stocks Feed"
        let client = HTTPClientSpy()
        let remoteStocksFeedService = RemoteStocksFeedService(client: client)
        let (sut, _) = make_sut(stocksFeedService: remoteStocksFeedService, title: title)

        XCTAssertEqual(sut.title, title)
        XCTAssertNotNil(sut.stocksFeedService as? RemoteStocksFeedService)
    }

    func test_loadFeed_setsLoadStateToTrue() {
        let client = HTTPClientSpy()
        let remoteStocksFeedService = RemoteStocksFeedService(client: client)
        let (sut, spy) = make_sut(stocksFeedService: remoteStocksFeedService)

        sut.loadFeed()

        XCTAssertEqual(spy.isLoading, true)
    }

    func test_loadFeed_triggersAPICall_whichSuccessOrFailure_setsLoadStateToFalse() {
        let client = HTTPClientSpy()
        let remoteStocksFeedService = RemoteStocksFeedService(client: client)
        let (sut, spy) = make_sut(stocksFeedService: remoteStocksFeedService)

        sut.loadFeed()
        XCTAssertEqual(spy.isLoading, true)
        client.complete(withStatusCode: 400, data: MockData.any_badJSONData())
        XCTAssertEqual(spy.isLoading, false)

        sut.loadFeed()
        XCTAssertEqual(spy.isLoading, true)
        client.complete(withStatusCode: 200, data: Data())
        XCTAssertEqual(spy.isLoading, false)
    }

    func test_loadFeed_triggersAPICall_whichOnError_returnsError() {
        let client = HTTPClientSpy()
        let remoteStocksFeedService = RemoteStocksFeedService(client: client)
        let (sut, spy) = make_sut(stocksFeedService: remoteStocksFeedService)
        let expectedError = NSError(domain: "Any Error", code: 404)

        sut.loadFeed()
        client.complete(with: expectedError)

        XCTAssertNotNil(spy.error)
    }

    func test_loadFeed_triggersAPICall_whichOnSuccess_returnsStocks() {
        let client = HTTPClientSpy()
        let remoteStocksFeedService = RemoteStocksFeedService(client: client)
        let (sut, spy) = make_sut(stocksFeedService: remoteStocksFeedService)

        let stocksResponseData = MockData.any_data(for: MockData.FileName.stocksFeed.rawValue, fromBundle: .module)
        let expectedFeed = try! JSONDecoder().decode(TestRemoteStocksFeed.self, from: stocksResponseData)
        sut.loadFeed()
        client.complete(withStatusCode: 200, data: stocksResponseData)

        XCTAssertEqual(spy.stocks, expectedFeed.stocks.toModels())
        XCTAssertEqual(spy.error, .none)
    }
}

// MARK: - Make SUT
extension StocksFeedViewModelUnitTests {
    private func make_sut(stocksFeedService: RemoteStocksFeedService, title: String = "Feed") -> (sut: StocksFeedViewModel, spy: StocksFeedSpy) {
        let sut = StocksFeedViewModel(stocksFeedService: stocksFeedService, title: title)
        trackForMemoryLeaks(sut)

        let spy = StocksFeedSpy(viewModel: sut)
        trackForMemoryLeaks(spy)

        return (sut, spy)
    }
}

// MARK: - StocksFeedSpy
extension StocksFeedViewModelUnitTests {
    private class StocksFeedSpy: NSObject {
        var isLoading: Bool = false
        var error: String?
        var stocks: [Stock]?

        var viewModel: StocksFeedViewModel

        init(viewModel: StocksFeedViewModel) {
            self.viewModel = viewModel
            super.init()

            bind()
        }

        func bind() {
            viewModel.onLoadingStateChange = { [weak self] isLoading in
                guard let self = self else { return }
                self.isLoading = isLoading
            }

            viewModel.onFeedLoadError = { [weak self] error in
                guard let self = self else { return }
                self.error = error
            }

            viewModel.onFeedLoadSuccess = { [weak self] stocks in
                guard let self = self else { return }
                self.stocks = stocks
            }
        }
    }
}


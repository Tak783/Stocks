//
//  StocksFeedComposerUnitTests.swift
//  StocksiOSAppTests
//
//  Created by Tak Mazarura on 06/04/2022.
//

import XCTest
import CoreFoundation
import CoreTesting
import MockNetworking
import StocksFeedFeature
@testable import StocksiOSApp

final class StocksFeedComposerUnitTests: XCTestCase {
    func test_composeWithService_configuresViewController() {
        let title = "Stocks Feed"
        let service = make_service()
        let sut = StocksFeedComposer.compose(
            with: service,
            title: title
        )
        trackForMemoryLeaks(service)

        XCTAssertEqual(sut.title, title)
        XCTAssertNotNil(sut.feedViewModel?.onFeedLoadError)
        XCTAssertNotNil(sut.feedViewModel?.onFeedLoadSuccess)
        XCTAssertNotNil(sut.feedViewModel?.onLoadingStateChange)
    }
}

// MARK: - Make SUT Helpers
extension StocksFeedComposerUnitTests {
    private func make_service() -> RemoteStocksFeedService {
        let client = HTTPClientSpy()
        trackForMemoryLeaks(client)

        let service = RemoteStocksFeedService(client: client)
        trackForMemoryLeaks(service)
        return service
    }
}

//
//  StockFeedItemViewModelTests.swift
//  
//
//  Created by Tak Mazarura on 04/04/2022.
//

import XCTest
import CoreTesting
@testable import StocksFeedFeature

final class StockFeedItemViewModelTests: XCTestCase {
    func test_init_setsInitialVariablesCorrectly() {
        let data = MockData.any_data(for: MockData.FileName.stock.rawValue, fromBundle: .module)
        do {
            let stock = try JSONDecoder().decode(TestRemoteStock.self, from: data)
            let sut = make_sut(withStock: stock.toModel())

            XCTAssertEqual(sut.ticker, "TWTR")
            XCTAssertEqual(sut.name, "Twitter, Inc.")
            XCTAssertEqual(sut.currency, "USD")
            XCTAssertEqual(sut.currentPrice, "US$38.33")
            XCTAssertEqual(sut.quantity, "25")
            XCTAssertEqual(sut.currentPriceTime, "11/11/2021, 19:08")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}

// MARK: - Make SUT
extension StockFeedItemViewModelTests {
    private func make_sut(withStock stock: Stock) -> StockFeedItemViewModel {
        let sut = StockFeedItemViewModel(with: stock)
        trackForMemoryLeaks(sut)
        return sut
    }
}

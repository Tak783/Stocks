//
//  StocksURLPoolTests.swift
//  
//
//  Created by Tak Mazarura on 03/04/2022.
//

import XCTest
import CoreFoundational
import CoreNetworking
import CoreTesting
@testable import StocksFeedFeature

final class StocksURLPoolTests: XCTestCase {
    let expectedScheme = "https"
    let expectedHost = "storage.googleapis.com"
    let expectedRequestPath = "/cash-homework/cash-stocks-api"
}

// MARK: - StocksAPIURLPoolable Tests
extension StocksURLPoolTests {
    func test_stocksRequest_configuresStocksRequestCorrectly() {
        let endpoint = "/portfolio.json"
        let expectedPathSuffix = expectedRequestPath + endpoint
        let expectedUrlAbsoluteString = fullURL(withPathSuffix: expectedPathSuffix)
        let request = URLPool.stocksFeedRequest()
        
        assert(request: request, urlAbsoluteString: expectedUrlAbsoluteString, httpMethod: .get)
    }
}

// MARK: - Test Helpers
extension StocksURLPoolTests {
    private func fullURL(withPathSuffix pathSuffix: String) -> String {
        return expectedScheme + "://" + expectedHost + pathSuffix
    }
}

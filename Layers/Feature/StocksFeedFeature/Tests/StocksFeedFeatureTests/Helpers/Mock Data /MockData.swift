//
//  TestData.swift
//  MockNetworking
//
//  Created by Takomborerwa Mazarura on 12/04/2021.
//
//

import Foundation
import MockNetworking

public final class MockData {
    public enum FileName: String {
        case stock = "Stock"
        case stocksFeed = "StocksFeed"
        case emptyStocksFeed = "EmptyStocksFeed"
        case malformedStocksFeed = "MalformedStocksFeed"
        case malformedJSON = "MalformedJSON"
    }

    public static var mockNetworkingBundle: Bundle {
        Bundle(for: MockData.self)
    }
}

extension MockData {
    public static func any_badJSONData() -> Data {
        return any_data(for: MockData.FileName.malformedJSON.rawValue, fromBundle: Bundle.module)
    }

    public static func any_data(for filename: String, fromBundle bundle: Bundle) -> Data {
        return MockServer.loadLocalJSON(filename, fromBundle: bundle)
    }
}

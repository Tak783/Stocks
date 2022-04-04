//
//  TestData.swift
//  MockNetworking
//
//  Created by Takomborerwa Mazarura on 12/04/2021.
//
//

import Foundation

public final class MockData {
    public enum FileName: String {
        case badJSON = "BadJSON"
        case recipe = "Recipe"
        case recipesFeed = "RecipesFeed"
    }

    public static var mockNetworkingBundle: Bundle {
        Bundle(for: MockData.self)
    }
}

extension MockData {
    public static func any_badJSONData() -> Data {
        return MockServer.loadLocalJSON(FileName.badJSON.rawValue, fromBundle: MockData.mockNetworkingBundle)
    }

    public static func any_data(for filename: String, fromBundle bundle: Bundle = MockData.mockNetworkingBundle) -> Data {
        return MockServer.loadLocalJSON(filename, fromBundle: bundle)
    }
}

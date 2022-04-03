//
//  URLPool.swift
//  
//
//  Created by Tak Mazarura on 03/04/2022.
//

import Foundation
import CoreFoundational
import CoreNetworking

// MARK: - URL Components
extension URLPool {
    private static let scheme = "https"
    private static let host = "storage.googleapis.com"
    private static let path = "/cash-homework/cash-stocks-api"
    
    private enum EndPoints: String {
        case stocks = "/portfolio.json"
    }
}

// MARK: - StocksAPIURLPoolable
extension URLPool: StocksAPIURLPoolable {
    static func stocksFeedRequest() -> URLRequest {
        let endPoint = path + EndPoints.stocks.rawValue
        let url = configureURL(scheme: scheme, host: host, path: endPoint)
        return .init(method: .get, url: url)
    }
}

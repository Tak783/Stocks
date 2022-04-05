//
//  RemoteStocksFeedService.swift
//  
//
//  Created by Tak Mazarura on 03/04/2022.
//

import Foundation
import CoreNetworking

public final class RemoteStocksFeedService: StocksFeedServiceable {
    let client: HTTPClient

    public enum Error: Swift.Error {
        case invalidResponse
        case invalidData
    }

    public init(client: HTTPClient) {
        self.client = client
    }

    public func load(completion: @escaping (StocksResult) -> Void) {
        let request = URLPool.stocksFeedRequest()
        client.performRequest(request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success((data, response)):
                self.handleLoadStocksSuccessResponse(data: data, response: response, completion: completion)
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
}

extension RemoteStocksFeedService {
    private func handleLoadStocksSuccessResponse(data: Data, response: HTTPURLResponse, completion: @escaping (StocksResult) -> Void) {
        do {
            if response.statusCode != 200 {
                completion(.failure(Error.invalidResponse))
            } else {
                let stockResponseFeed = try JSONDecoder().decode(RemoteStocksFeed.self, from: data)
                completion(.success(stockResponseFeed.stocks.toModels()))
            }
        } catch {
            completion(.failure(Error.invalidData))
        }
    }
}

private struct RemoteStocksFeed: Decodable {
    let stocks: [RemoteStock]
}

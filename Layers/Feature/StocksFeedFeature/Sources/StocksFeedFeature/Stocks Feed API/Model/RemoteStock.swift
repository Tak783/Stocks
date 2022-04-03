//
//  RemoteStock.swift
//  
//
//  Created by Tak Mazarura on 03/04/2022.
//

import Foundation

struct RemoteStock: Decodable {
    let ticker: String
    let name: String
    let currency: String
    let quantity: Int
    let currentPriceCents: Int
    let currentPriceTimeStamp: Int
    
    enum CodingKeys: String, CodingKey {
        case ticker = "ticker"
        case name = "name"
        case currency = "currency"
        case quantity = "quantity"
        case currentPriceCents = "current_price_cents"
        case currentPriceTimeStamp = "current_price_timestamp"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ticker = try container.decode(String.self, forKey: .lastName)
        name = try container.decode(String.self, forKey: .name)
        currency = try container.decode(String.self, forKey: .currency)
        quantity = try container.decode(Int.self, forKey: .quantity)
        currentPriceCents = try container.decode(Int.self, forKey: .currentPriceCents)
        currentPriceTimeStamp = try container.decode(Int.self, forKey: .currentPriceTimeStamp)
    }
}

extension RemoteStock {
    func toModel() -> Stock {
        Stock(
            ticker: ticker,
            name: name,
            currency: currency,
            quantity: quantity,
            currentPriceCents: currentPriceCents,
            currentPriceTimeStamp: currentPriceTimeStamp
        )
    }
}

extension Array where Element == RemoteStock {
    func toModels() -> [Stock] {
        self.compactMap {
            $0.toModel()
        }
    }
}

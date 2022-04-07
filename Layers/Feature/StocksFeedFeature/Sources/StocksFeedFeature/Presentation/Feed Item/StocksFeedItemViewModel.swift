//
//  StockFeedItemViewModel.swift
//  
//
//  Created by Tak Mazarura on 04/04/2022.
//

import Foundation
import CashAppFoundation

public final class StockFeedItemViewModel: StockFeedItemViewModellable {
    public private(set) var ticker: String
    public private(set) var name: String
    public private(set) var currency: String
    public private(set) var quantity: String?
    public private(set) var currentPrice: String
    public private(set) var currentPriceTime: String

    public init(with stock: Stock) {
        ticker = stock.ticker
        name = stock.name
        currency = stock.currency
        quantity = "Quanitity: \(String(stock.quantity ?? 0))"
        currentPrice = PriceToCurrencyConverter.convert(
            priceInCents: stock.currentPriceCents,
            withCurrencyCode: Self.currency(fromCode: stock.currency)
        )
        currentPriceTime = DateConvertor.dateStringFrom(
            timeStamp: stock.currentPriceTimeStamp,
            withDateFormatter: DateFormatter.shortStyleDateTimeFormatter
        )
    }
}

extension StockFeedItemViewModel {
    private static func currency(fromCode code: String) -> Currency {
        guard let currency = Currency(rawValue: code.lowercased()) else {
            assertionFailure("Currency code passed in is invlaid")
            return .usd
        }
        return currency
    }
}

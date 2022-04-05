//
//  ConvertToCurrency.swift
//  
//
//  Created by Tak Mazarura on 05/04/2022.
//

import Foundation

public struct ConvertToCurrency {
    public static func convert(
        priceInCents: Int,
        withCurrencyCode currencyCode: Currency
    ) -> String {
        let formatter = NumberFormatter.currencyNumberFormatter(withCurrencyCode: currencyCode)
        let priceAsDouble = ConvertToCurrency.convertToDouble(cents: priceInCents)
        let priceAsNumber = NSNumber(value: priceAsDouble)
        guard let priceAsCurrency = formatter.string(from: priceAsNumber) else {
            assertionFailure("Could not convert currency")
            return .init()
        }
        return priceAsCurrency
    }
}

extension ConvertToCurrency {
    private static func convertToDouble(cents: Int) -> Double {
        Double(cents) / 100
    }
}


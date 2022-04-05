//
//  NumberFormatterr+CurrencyExtensions.swift
//  
//
//  Created by Tak Mazarura on 05/04/2022.
//

import Foundation

public extension NumberFormatter {
    /// Returns a short style date/time formatter in user's locale.  E.g., 07/11/2016, 16:37
    static func currencyNumberFormatter(
        withCurrencyCode currencyCode: Currency
    ) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.currencyCode = currencyCode.rawValue
        return formatter
    }
}

//
//  NumberFormatterr+CurrencyExtensionsUnitTests.swift
//  
//
//  Created by Tak Mazarura on 05/04/2022.
//

import Foundation
import XCTest
import CashAppFoundation

final class NumberFormatterrCurrencyExtensionsUnitTests: XCTestCase {
    func test_currencyTimeFormatter_formatsPriceInCentsToCurrencyFormat() {
        let priceInCents1 = 2211
        let currencyCode1 = Currency.usd
        let expectedPrice1 = "US$22.11"
        
        Self.assert_currencyTimeFormatter_formatsCurrencyTo(
            expectedFomattedPrice: expectedPrice1,
            fromPriceInCents: priceInCents1,
            currencyCode: currencyCode1
        )
        
        let priceInCents2 = 4433
        let currencyCode2 = Currency.gbp
        let expectedPrice2 = "£44.33"
        
        Self.assert_currencyTimeFormatter_formatsCurrencyTo(
            expectedFomattedPrice: expectedPrice2,
            fromPriceInCents: priceInCents2,
            currencyCode: currencyCode2
        )
        
        let priceInCents3 = 8876
        let currencyCode3 = Currency.eur
        let expectedPrice3 = "€88.76"
        
        Self.assert_currencyTimeFormatter_formatsCurrencyTo(
            expectedFomattedPrice: expectedPrice3,
            fromPriceInCents: priceInCents3,
            currencyCode: currencyCode3
        )
        
        let priceInCents4 = 1211
        let currencyCode4 = Currency.hkd
        let expectedPrice4 = "HK$12.11"
        
        Self.assert_currencyTimeFormatter_formatsCurrencyTo(
            expectedFomattedPrice: expectedPrice4,
            fromPriceInCents: priceInCents4,
            currencyCode: currencyCode4
        )
    }
}
 
// MARK: - Test Helpers
extension NumberFormatterrCurrencyExtensionsUnitTests {
    private static func assert_currencyTimeFormatter_formatsCurrencyTo(
        expectedFomattedPrice: String,
        fromPriceInCents priceInCents: Int,
        currencyCode: Currency,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let formatter = NumberFormatter.currencyNumberFormatter(withCurrencyCode: currencyCode)
        let priceAsDouble = Double(priceInCents) / 100
        let priceAsNumber = NSNumber(value: priceAsDouble)
        let sut = formatter.string(from: priceAsNumber)
        XCTAssertEqual(sut, expectedFomattedPrice, file: file, line: line)
    }
}

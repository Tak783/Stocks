//
//  ConvertToCurrencyUnitTests.swift
//  
//
//  Created by Tak Mazarura on 05/04/2022.
//

import Foundation
import XCTest
import CashAppFoundation

final class ConvertToCurrencyUnitTests: XCTestCase {
    func test_convertToCurrency_convertsPriceInCentsToCurrencyFormat() {
        let priceInCents1 = 2211
        let currencyCode1 = Currency.usd
        let expectedPrice1 = "US$22.11"
        
        let convertedPrice1 = PriceToCurrencyConverter.convert(priceInCents: priceInCents1, withCurrencyCode:currencyCode1)
        XCTAssertEqual(convertedPrice1, expectedPrice1)
        
        let priceInCents2 = 1211
        let currencyCode2 = Currency.hkd
        let expectedPrice2 = "HK$12.11"
        
        let convertedPrice2 = PriceToCurrencyConverter.convert(priceInCents: priceInCents2, withCurrencyCode:currencyCode2)
        XCTAssertEqual(convertedPrice2, expectedPrice2)
        
        let priceInCents3 = 4433
        let currencyCode3 = Currency.gbp
        let expectedPrice3 = "£44.33"
        
        let convertedPrice3 = PriceToCurrencyConverter.convert(priceInCents: priceInCents3, withCurrencyCode:currencyCode3)
        XCTAssertEqual(convertedPrice3, expectedPrice3)
    }
}

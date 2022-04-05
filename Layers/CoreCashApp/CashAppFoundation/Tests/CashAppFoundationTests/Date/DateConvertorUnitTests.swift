//
//  DateConvertorUnitTests.swift
//  
//
//  Created by Tak Mazarura on 05/04/2022.
//

import Foundation
import XCTest
import CashAppFoundation

final class DateConvertorUnitTests: XCTestCase {
    func test_convertToCurrency_convertsPriceInCentsToCurrencyFormat() {
        let dateFormatter = DateFormatter.shortStyleDateTimeFormatter
        
        let timeStamp1 = 1636657688
        let expectedFomattedTime1 = "11/11/2021, 19:08"
        let sut = DateConvertor.dateStringFrom(timeStamp: timeStamp1, withDateFormatter: dateFormatter)
        XCTAssertEqual(sut, expectedFomattedTime1)
        
        let timeStamp2 = 1656657688
        let expectedFomattedTime2 = "01/07/2022, 07:41"
        let sut2 = DateConvertor.dateStringFrom(timeStamp: timeStamp2, withDateFormatter: dateFormatter)
        XCTAssertEqual(sut2, expectedFomattedTime2)
        
        let timeStamp3 = 1836657688
        let expectedFomattedTime3 = "14/03/2028, 14:41"
        let su3 = DateConvertor.dateStringFrom(timeStamp: timeStamp3, withDateFormatter: dateFormatter)
        XCTAssertEqual(su3, expectedFomattedTime3)
    }
}


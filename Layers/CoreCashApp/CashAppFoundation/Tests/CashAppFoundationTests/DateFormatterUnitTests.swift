//
//  DateFormatterUnitTests.swift
//  
//
//  Created by Tak Mazarura on 05/04/2022.
//

import Foundation
import XCTest
import CashAppFoundation

final class DateFormatterUnitTests: XCTestCase {
    func test_shortStyleDateTimeFormatter_formatsTimeStampToShortDateFormat() {
        let timeStamp1 = 1636657688
        let expectedFomattedTime1 = "11/11/2021, 19:08"
        Self.assert_shortStyleDateTimeFormatter_formatsDateTo(
            expectedFomattedTime: expectedFomattedTime1,
            timeStamp: timeStamp1
        )
        
        let timeStamp2 = 1656657688
        let expectedFomattedTime2 = "01/07/2022, 07:41"
        Self.assert_shortStyleDateTimeFormatter_formatsDateTo(
            expectedFomattedTime: expectedFomattedTime2,
            timeStamp: timeStamp2
        )
        
        let timeStamp3 = 1836657688
        let expectedFomattedTime3 = "14/03/2028, 14:41"
        Self.assert_shortStyleDateTimeFormatter_formatsDateTo(
            expectedFomattedTime: expectedFomattedTime3,
            timeStamp: timeStamp3
        )
    }
}
 
// MARK: - Test Helpers
extension DateFormatterUnitTests {
    private static func assert_shortStyleDateTimeFormatter_formatsDateTo(
        expectedFomattedTime: String, timeStamp: Int, file: StaticString = #file, line: UInt = #line
    ) {
        let timeStampTimeInterval = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: timeStampTimeInterval)
        let sut = DateFormatter.shortStyleDateTimeFormatter.string(
            from: date
        )
        XCTAssertEqual(sut, expectedFomattedTime, file: file, line: line)
    }
}

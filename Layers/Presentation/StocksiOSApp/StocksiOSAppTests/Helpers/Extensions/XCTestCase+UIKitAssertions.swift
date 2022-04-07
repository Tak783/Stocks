//
//  XCTestCase+UIKitAssertions.swift
//  
//
//  Created by Tak Mazarura on 06/04/2022.
//

import XCTest
import UIKit

extension XCTestCase {
    public func assert(
        label: UILabel?,
        isShowingDefaultState: Bool,
        state: String = "-",
        isHidden: Bool,
        file: StaticString = #file,
        line: UInt  = #line
    ) {
        let messagePrefix = "Expected Label with Identifier \(label?.accessibilityIdentifier ?? "Which is not known") "
        let defaultStateMessage = "\(messagePrefix) to \(isShowingDefaultState ? "" : "not ")show default State: `\(state)`"
        let hiddenMessage = "\(messagePrefix) to \(isHidden ? "" : "not ")be hidden"

        XCTAssert((label?.text == state) == isShowingDefaultState, defaultStateMessage, file: file, line: line)
        XCTAssertEqual(label?.isHidden, isHidden, hiddenMessage, file: file, line: line)
    }
}

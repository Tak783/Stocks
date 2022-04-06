//
//  StocksFeedTableViewCellUnitTests.swift
//  StocksiOSAppTests
//
//  Created by Tak Mazarura on 06/04/2022.
//

import XCTest
import CoreFoundational
import CoreTesting
import MockNetworking
@testable import StocksiOSApp

final class StockFeedTableViewCellTests: XCTestCase {
    func test_awakeFromNib_showsViewInDefaultState() {
        let sut = make_sut()

        sut.awakeFromNib()

        assert(sut: sut, isShowingDefaultState: true)
    }

    private func assert(sut: StocksFeedTableViewCell,
                        isShowingDefaultState: Bool,
                        file: StaticString = #file,
                        line: UInt  = #line) {
        
        assert(
            label: sut.titleLabel,
            isShowingDefaultState: isShowingDefaultState,
            isHidden: false,
            file: file, line: line
        )
        
        assert(
            label: sut.headlineLabel,
            isShowingDefaultState: isShowingDefaultState,
            isHidden: false,
            file: file, line: line
        )
        
        assert(
            label: sut.currencyLabel,
            isShowingDefaultState: isShowingDefaultState,
            isHidden: false,
            file: file, line: line
        )
        
        assert(
            label: sut.quantity,
            isShowingDefaultState: isShowingDefaultState,
            isHidden: false,
            file: file, line: line
        )
        
        assert(
            label: sut.currentPriceLabel,
            isShowingDefaultState: isShowingDefaultState,
            isHidden: false,
            file: file, line: line
        )
        
        assert(
            label: sut.currentPriceTimeLabel,
            isShowingDefaultState: isShowingDefaultState,
            isHidden: false,
            file: file, line: line
        )
    }
}

// MARK: - Make SUT
extension StockFeedTableViewCellTests {
    private func make_sut() -> StocksFeedTableViewCell {
        let nib = UINib(nibName: StocksFeedTableViewCell.className,
                        bundle: Bundle(for: StocksFeedTableViewCell.self))
        let sut = nib.instantiate(withOwner: self, options: nil).first as! StocksFeedTableViewCell
        trackForMemoryLeaks(sut)
        return sut
    }
}

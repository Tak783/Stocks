//
//  StocksFeedViewControllerIntegrationTests.swift
//  StocksiOSAppTests
//
//  Created by Tak Mazarura on 05/04/2022.
//

import XCTest
import CoreFoundation
import CoreTesting
@testable import StocksiOSApp

final class StocksFeedViewControllerIntegrationTests: XCTestCase {
    func test_initialState() {
        let sut = make_sut()

        test_title_isCorrect(for: sut)
        test_outlets_connected(for: sut)
        test_table_isSetup(for: sut)
        XCTAssertEqual(sut.isShowingErrorState, false, "Should Not Be Showing Error State")
    }
}

// MARK: - Make SUT
extension StocksFeedViewControllerIntegrationTests {
    private func make_sut() -> StocksFeedViewController {
        let bundle = Bundle(for: StocksFeedViewController.self)
        let storyboard = UIStoryboard(name: "StocksFeed", bundle: bundle)
        let navigationController = UINavigationController()
        let sut = storyboard.instantiateViewController(withIdentifier: StocksFeedViewController.className) as! StocksFeedViewController
        navigationController.pushViewController(sut, animated: false)
        trackForMemoryLeaks(sut)
        sut.loadViewIfNeeded()
        return sut
    }
}

// MARK: - Test Helpers
extension StocksFeedViewControllerIntegrationTests {
    private func test_title_isCorrect(for sut: StocksFeedViewController,
                                      file: StaticString = #file, line: UInt  = #line) {
        XCTAssertEqual(sut.navigationController?.navigationBar.prefersLargeTitles, true, file: file, line: line)
        XCTAssertEqual(sut.navigationItem.title, "Stocks", file: file, line: line)
    }

    private func test_outlets_connected(for sut: StocksFeedViewController,
                                        file: StaticString = #file, line: UInt  = #line) {
        XCTAssertNotNil(sut.table,
                        "Table should not be nil", file: file, line: line)
        XCTAssertNotNil(sut.loadingIndicator,
                        "Loading Indicator should not be nil", file: file, line: line)
        XCTAssertNotNil(sut.errorView,
                        "Error View should not be nil", file: file, line: line)
        XCTAssertNotNil(sut.refreshControl,
                        "Refresh Control should not be nil", file: file, line: line)
    }

    private func test_table_isSetup(for sut: StocksFeedViewController,
                                    file: StaticString = #file, line: UInt  = #line) {
        XCTAssertNotNil(sut.table?.dataSource,
                        "Table DataSource should not be nil", file: file, line: line)
        XCTAssertNotNil(sut.table?.delegate,
                        "Table Delegate should not be nil", file: file, line: line)

        let expectedSections = 1
        let expectedRows = 0
        XCTAssertEqual(sut.table?.allowsSelection, false,
                       "Table should not allow selection", file: file, line: line)
        XCTAssertEqual(sut.table?.numberOfSections, expectedSections,
                       "Table should have \(expectedSections) sections", file: file, line: line)
        XCTAssertEqual(sut.table?.numberOfRows(inSection: 0), expectedRows,
                       "Table should have \(expectedRows) rows", file: file, line: line)
    }
}

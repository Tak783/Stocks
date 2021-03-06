//
//  StocksFeedViewController+DSLHelpers.swift
//  StocksiOSAppTests
//
//  Created by Tak Mazarura on 05/04/2022.
//

import Foundation
import UIKit
@testable import StocksiOSApp

// MARK: - Domain Specific Language Var's
extension StocksFeedViewController {
    var table: UITableView? {
        view.findChildView(byAccessibilityIdentifier: "stocks-feed-table") as? UITableView
    }
    
    var loadingIndicator: UIRefreshControl? {
        table?.refreshControl
    }

    var isShowingLoadingState: Bool {
        guard let loadingView = loadingIndicator else {
            assertionFailure("Loading Indicator should be present")
            return false
        }
        return loadingView.isRefreshing
    }

    var errorView: UIView? {
        view.findChildView(byAccessibilityIdentifier: "error-view")
    }

    var refreshControl: UIRefreshControl? {
        view.findChildView(byAccessibilityIdentifier: "feed-refresh-control") as? UIRefreshControl
    }

    var isShowingErrorState: Bool {
        if errorView == nil {
            assertionFailure("Error View should not be nil")
        }
        if errorView?.isHidden == false, isShowingLoadingState == false  {
            return true
        }
        return false
    }
}

// MARK: - Domain Specific Language Functions
extension StocksFeedViewController {
    func simulatePullToRefresh() {
        refreshControl?.beginRefreshing()
    }
}

//
//  StocksFeedComposer.swift
//  StocksiOSApp
//
//  Created by Tak Mazarura on 06/04/2022.
//

import Foundation
import UIKit
import StocksFeedFeature

final class StocksFeedComposer {
    static func compose(with service: StocksFeedServiceable, title: String) -> StocksFeedViewController {
        let viewModel = StocksFeedViewModel(stocksFeedService: service, title: title)
        let stockFeedViewController = make(with: viewModel)
        viewModel.onFeedLoadSuccess = adaptStocksFeedToCellControllers(for: stockFeedViewController)
        return stockFeedViewController
    }
}

// MARK: - Create StocksFeedViewController
extension StocksFeedComposer {
    private static func make(with viewModel: StocksFeedViewModellable) -> StocksFeedViewController {
        let stocksFeedViewController = StocksFeedViewController.instantiate()
        stocksFeedViewController.feedViewModel = viewModel
        return stocksFeedViewController
    }
}

// MARK: - Adapt Stocks For StocksFeedViewController
extension StocksFeedComposer {
    private static func adaptStocksFeedToCellControllers(for controller: StocksFeedViewController) -> ([Stock]) -> Void {
        return { [weak controller] stocks in
            guard let controller = controller else { return }
            let model = stocks.map { (stock) -> StockFeedItemController in
                let stockFeedViewModel = StockFeedItemViewModel(with: stock)
                return StockFeedItemController(viewModel: stockFeedViewModel)
            }
            controller.tableModel = model
        }
    }
}

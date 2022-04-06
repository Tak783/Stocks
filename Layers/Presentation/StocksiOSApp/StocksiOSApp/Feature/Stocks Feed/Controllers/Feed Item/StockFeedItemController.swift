//
//  StockFeedItemController.swift
//  StocksiOSApp
//
//  Created by Tak Mazarura on 06/04/2022.
//

import StocksFeedFeature
import UIKit

final class StockFeedItemController: StocksFeedItemControllable {
    var viewModel: StockFeedItemViewModellable

    init(viewModel: StockFeedItemViewModellable) {
        self.viewModel = viewModel
    }
}

// MARK: - StockFeedItemTableViewControllable
extension StockFeedItemController: StocksFeedItemTableViewControllable {
    func view(in tableView: UITableView) -> StocksFeedTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StocksFeedTableViewCell.className) as? StocksFeedTableViewCell else {
            assertionFailure("Could not dequeue `StocksFeedTableViewCell` from TableView")
            return .init()
        }
        return binded(cell: cell, viewModel: viewModel)
    }

    private func binded(cell: StocksFeedTableViewCell,
                        viewModel: StockFeedItemViewModellable) -> StocksFeedTableViewCell {
        cell.update(withViewModel: viewModel)
        return cell
    }
}

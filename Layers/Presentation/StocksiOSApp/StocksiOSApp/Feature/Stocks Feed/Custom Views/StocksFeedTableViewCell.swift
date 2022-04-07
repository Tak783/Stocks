//
//  StocksFeedTableViewCell.swift
//  StocksiOSApp
//
//  Created by Tak Mazarura on 06/04/2022.
//

import UIKit
import StocksFeedFeature

final class StocksFeedTableViewCell: UITableViewCell {
    @IBOutlet private var tickerLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var currencyLabel: UILabel!
    @IBOutlet private var quantityLabel: UILabel!
    @IBOutlet private var currentPriceLabel: UILabel!
    @IBOutlet private var currentPriceTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViewForDefaultState()
    }

    private func setupViewForDefaultState() {
        tickerLabel.text = "-"
        nameLabel.text = "-"
        currencyLabel.text = "-"
        quantityLabel.text = "-"
        currentPriceLabel.text = "-"
        currentPriceTimeLabel.text = "-"
    }
}

// MARK: - StockFeedItemViewable
extension StocksFeedTableViewCell: StockFeedItemViewable {
    func update(withViewModel viewModel: StockFeedItemViewModellable) {
        tickerLabel.text = viewModel.ticker
        nameLabel.text = viewModel.name
        currencyLabel.text = viewModel.currency
        quantityLabel.text = viewModel.quantity
        currentPriceLabel.text = viewModel.currentPrice
        currentPriceTimeLabel.text = viewModel.currentPriceTime
    }
}

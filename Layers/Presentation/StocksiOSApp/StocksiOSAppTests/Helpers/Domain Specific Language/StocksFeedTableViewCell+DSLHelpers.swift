//
//  StocksFeedTableViewCell+DSLHelpers.swift
//  StocksiOSAppTests
//
//  Created by Tak Mazarura on 06/04/2022.
//

import UIKit
@testable import StocksiOSApp

// MARK: - Domain Specific Language Variables
extension StocksFeedTableViewCell {
    var titleLabel: UILabel? {
        findChildView(byAccessibilityIdentifier: "ticker-label") as? UILabel
    }
    
    var headlineLabel: UILabel? {
        findChildView(byAccessibilityIdentifier: "name-label") as? UILabel
    }

    var currencyLabel: UILabel? {
        findChildView(byAccessibilityIdentifier: "currency-label") as? UILabel
    }
    
    var quantity: UILabel? {
        findChildView(byAccessibilityIdentifier: "quantity-label") as? UILabel
    }
    
    var currentPriceLabel: UILabel? {
        findChildView(byAccessibilityIdentifier: "current-price-label") as? UILabel
    }

    var currentPriceTimeLabel: UILabel? {
        findChildView(byAccessibilityIdentifier: "current-price-time-label") as? UILabel
    }
}

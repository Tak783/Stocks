//
//  UIView+Extensions.swift
//  StocksiOSAppTests
//
//  Created by Tak Mazarura on 05/04/2022.
//

import UIKit

public extension UIView {
    func findChildView(byAccessibilityIdentifier accessibilityIdentifier: String) -> UIView? {
        guard let foundView = subviews.first(where: { $0.accessibilityIdentifier == accessibilityIdentifier }) else {
            return subviews.lazy.compactMap {
                $0.findChildView(byAccessibilityIdentifier: accessibilityIdentifier)
            }.first
        }
        return foundView
    }
}

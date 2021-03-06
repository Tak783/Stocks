//
//  UIView+Accessibility.swift
//  StocksiOSApp
//
//  Created by Tak Mazarura on 05/04/2022.
//

import UIKit

public extension UIView {
    func makeViewAccessible(isAccessibilityElement: Bool,
                            accessibilityLabel: String? = nil,
                            accessibilityHint: String? = nil,
                            accessibilityValue: String? = nil) {
        self.isAccessibilityElement = isAccessibilityElement
        
        guard isAccessibilityElement else {
            return
        }
        self.accessibilityLabel = accessibilityLabel // Used to identify/define the element in voice over
        self.accessibilityHint = accessibilityHint // Describes the element or the result of interacting with it
        self.accessibilityValue = accessibilityValue // Describes the value of the element
    }
}

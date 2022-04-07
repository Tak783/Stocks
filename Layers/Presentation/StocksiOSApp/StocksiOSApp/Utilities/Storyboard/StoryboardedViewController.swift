//
//  StoryboardedViewController.swift
//  StocksiOSApp
//
//  Created by Tak Mazarura on 06/04/2022.
//

import UIKit

typealias StoryboardedViewController = UIViewController & Storyboarded

extension Storyboarded where Self: UIViewController {
    private static var storyboardName: String {
        className.deletingSuffix("ViewController")
    }

    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("Could not create View Controller with name \(className) from storyboard \(storyboardName)")
        }
        return viewController
    }
}

fileprivate extension String {
    /// Removes the given String from the end of the string String.
    /// If the text is not present, returns the original String intact.
    ///
    /// - Parameters:
    ///     - suffix: The text to be removed, e.g. "ViewController"
    ///
    /// - Returns:
    ///     - If suffix was found, String with the suffix removed, e.g. "MainViewController" -> "Main"
    ///     - If no suffix was found, the original string intact. e.g. "MainCoordinator" -> "MainCoordinator"
    ///
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
}


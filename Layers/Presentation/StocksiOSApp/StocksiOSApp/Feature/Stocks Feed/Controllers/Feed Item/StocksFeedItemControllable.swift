//
//  StocksFeedItemControllable.swift
//  StocksiOSApp
//
//  Created by Tak Mazarura on 06/04/2022.
//

import UIKit
import StocksFeedFeature

public protocol StocksFeedItemControllable: AnyObject {
    var viewModel: StockFeedItemViewModellable { get }
}

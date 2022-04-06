//
//  StockFeedItemViewable.swift
//  StocksiOSApp
//
//  Created by Tak Mazarura on 06/04/2022.
//

import Foundation
import StocksFeedFeature

protocol StockFeedItemViewable {
    func update(withViewModel viewModel: StockFeedItemViewModellable)
}

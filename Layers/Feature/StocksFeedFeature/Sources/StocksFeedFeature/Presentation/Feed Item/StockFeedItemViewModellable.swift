//
//  StockFeedItemViewModellable.swift
//  
//
//  Created by Tak Mazarura on 05/04/2022.
//

import Foundation

public protocol StockFeedItemViewModellable: AnyObject {
    var ticker: String { get }
    var name: String { get }
    var currency: String { get }
    var quantity: String? { get }
    var currentPrice: String { get }
    var currentPriceTime: String { get }
}

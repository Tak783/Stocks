//
//  StocksFeedViewModellable.swift
//  
//
//  Created by Tak Mazarura on 04/04/2022.
//

import Foundation
import CoreFoundational

public protocol StocksFeedViewModellable: AnyObject {
    var title: String { get set }
    
    var onLoadingStateChange: Observer<Bool>? { get set }
    var onFeedLoadError: Observer<String?>? { get set }
    var onFeedLoadSuccess: Observer<[Stock]>? { get set }
    
    var stocksFeedService: StocksFeedServiceable { get set }

    func loadFeed()
}

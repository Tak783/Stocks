//
//  StocksFeedServiceable.swift
//  
//
//  Created by Tak Mazarura on 03/04/2022.
//

import Foundation

public protocol StocksFeedServiceable: AnyObject  {
    typealias StocksResult = Swift.Result<[Stock], Error>

    func load(completion: @escaping (StocksResult) -> Void)
}

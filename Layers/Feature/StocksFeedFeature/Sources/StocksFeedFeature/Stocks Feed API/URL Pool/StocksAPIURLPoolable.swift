//
//  StocksAPIURLPoolable.swift
//  
//
//  Created by Tak Mazarura on 03/04/2022.
//

import Foundation

protocol StocksAPIURLPoolable {
    static func stocksFeedRequest() -> URLRequest
}

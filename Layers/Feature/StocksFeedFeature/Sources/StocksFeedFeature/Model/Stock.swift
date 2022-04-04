//
//  Stock.swift
//  
//
//  Created by Tak Mazarura on 03/04/2022.
//

import Foundation

public struct Stock: Equatable {
    let ticker: String
    let name: String
    let currency: String
    let quantity: Int?
    let currentPriceCents: Int
    let currentPriceTimeStamp: Int
}

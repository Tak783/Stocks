//
//  RemoteStocksFeedServiceSpec.swift
//  
//
//  Created by Tak Mazarura on 04/04/2022.
//

import Foundation
import XCTest

protocol RemoteStocksFeedServiceSpec {
    func test_load_onSuccess_returnsStocks()
    func test_load_onSuccessWithNon200Code_returnsError()
    func test_load_onSuccessWithNonInvalidData_returnsError()
    func test_load_onFailure_returnsError()
}

typealias RemoteStocksFeedServiceTest = XCTestCase & RemoteStocksFeedServiceSpec

//
//  StocksFeedItemTableViewControllable.swift
//  StocksiOSApp
//
//  Created by Tak Mazarura on 06/04/2022.
//

import UIKit

protocol StocksFeedItemTableViewControllable: AnyObject {
    func view(in tableView: UITableView) -> StocksFeedTableViewCell
}

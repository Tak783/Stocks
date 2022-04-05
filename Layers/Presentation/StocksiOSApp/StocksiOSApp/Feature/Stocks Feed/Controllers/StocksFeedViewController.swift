//
//  StocksFeedViewController.swift
//  StocksiOSApp
//
//  Created by Tak Mazarura on 05/04/2022.
//

import UIKit
import CoreFoundational

final class StocksFeedViewController: UIViewController {
    @IBOutlet private var errorView: UIView!
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.accessibilityIdentifier = "stocks-feed-table"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        refreshFeed()
    }
}

// MARK: - Setup View
extension StocksFeedViewController {
    private func setupView() {
        setupRefreshControl()
        setupTableView()
        makeAccessible()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func makeAccessible() {
        tableView.makeViewAccessible(
            isAccessibilityElement: true,
            accessibilityLabel: "Localized.Stock.feed.accessibilityLabel",
            accessibilityHint: "Localized.Stock.feed.accessibilityHint"
        )
    }
    
    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.accessibilityIdentifier = "feed-refresh-control"
        refreshControl.addTarget(self, action: #selector(refreshFeed), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
}

// MARK: - Bind View
extension StocksFeedViewController {
    private func bind() {
        
    }
    
    private func bindLoadingState() {
        
    }
    
    private func bindLoadingErrorState() {
        
    }
}


// MARK: - Reload Table
extension StocksFeedViewController {
    private func reloadTable() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    @objc private func refreshFeed() {
        
    }
    
    private func setLoadingState(_ willShowLoadingState: Bool) {
        if willShowLoadingState {
            errorView.isHidden = true
            if tableView.refreshControl?.isRefreshing == false {
                tableView.refreshControl?.beginRefreshing()
            }
        } else {
            tableView.refreshControl?.endRefreshing()
        }
    }
}


// MARK: - UITableViewDataSource
extension StocksFeedViewController {
    private func setupTableView() {
        registerCellsForTable()
        setupRefreshControl()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerCellsForTable() {
        
    }
}

// MARK: - UITableViewDataSource
extension StocksFeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return .init()
    }
}

extension StocksFeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        .init()
    }
}

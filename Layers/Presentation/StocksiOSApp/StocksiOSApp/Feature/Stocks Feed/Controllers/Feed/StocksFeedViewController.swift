//
//  StocksFeedViewController.swift
//  StocksiOSApp
//
//  Created by Tak Mazarura on 05/04/2022.
//

import UIKit
import CoreFoundational
import StocksFeedFeature

final class StocksFeedViewController: StoryboardedViewController {
    @IBOutlet private var errorView: UIView!
    @IBOutlet private var errorViewTitleLabel: UILabel!
    @IBOutlet private var stockFeedEmptyMessageLabel: UILabel!
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.accessibilityIdentifier = "stocks-feed-table"
        }
    }
    
    var feedViewModel: StocksFeedViewModellable? {
        didSet {
            bind()
        }
    }
    var tableModel = [StocksFeedItemControllable]() {
        didSet {
            reloadTable()
        }
    }
    
    // MARK: - View Controller Lifecylce
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
            accessibilityLabel: "Stock Feed",
            accessibilityHint: "Shows a feed of stocks"
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
        title = feedViewModel?.title
        bindLoadingState()
        bindLoadingErrorState()
        bindLoadingEmptyState()
    }
    
    private func bindLoadingState() {
        feedViewModel?.onLoadingStateChange = { [weak self] isLoading in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.setLoadingState(isLoading)
            }
        }
    }
    
    private func bindLoadingErrorState() {
        feedViewModel?.onFeedLoadError = { [weak self] errorMessage in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.showErrorView(withErrorMessage: errorMessage)
            }
        }
    }
    
    private func bindLoadingEmptyState() {
        feedViewModel?.onFeedLoadEmptyState = { [weak self] isEmpty in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.showEmptyFeedState(isEmpty)
            }
        }
    }
}

// MARK: - Bind View
extension StocksFeedViewController {
    private func showErrorView(withErrorMessage errorMessage: String?, backgroundColor: UIColor = .red) {
        var errrorViewIsHidden = true
        if errorMessage != .none {
            errrorViewIsHidden = false
            errorViewTitleLabel.text = errorMessage
        }
        errorView.isHidden = errrorViewIsHidden
        errorView.backgroundColor = backgroundColor
    }
    
    private func showEmptyFeedState(_ isEmpty: Bool) {
        showErrorView(withErrorMessage: isEmpty ? "Stock feed returned was empty\n Pull to refresh feed" : .none, backgroundColor: .systemBlue)
    }
}

// MARK: - Setup Table View
extension StocksFeedViewController {
    private func setupTableView() {
        registerCellsForTable()
        setupRefreshControl()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerCellsForTable() {
        let bundle = Bundle(for: StocksFeedTableViewCell.self)
        let nib = UINib(nibName: StocksFeedTableViewCell.className, bundle: bundle)
        tableView.register(nib, forCellReuseIdentifier: StocksFeedTableViewCell.className)
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
        feedViewModel?.loadFeed()
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
extension StocksFeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = tableModel[indexPath.row] as? StocksFeedItemTableViewControllable else {
            assertionFailure("ViewModel should adhere to `StocksFeedItemTableViewControllable`")
            return .init()
        }
        return viewModel.view(in: tableView)
    }
}

// MARK: - UITableViewDelegate
extension StocksFeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        .init()
    }
}

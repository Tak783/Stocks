//
//  StocksFeedViewModel.swift
//  
//
//  Created by Tak Mazarura on 04/04/2022.
//

import CoreFoundational

public final class StocksFeedViewModel: StocksFeedViewModellable {
    public var onLoadingStateChange: Observer<Bool>?
    public var onFeedLoadError: Observer<String?>?
    public var onFeedLoadSuccess: Observer<[Stock]>?

    public var stocksFeedService: StocksFeedServiceable
    public var title: String

    public init(stocksFeedService: StocksFeedServiceable, title: String) {
        self.title = title
        self.stocksFeedService = stocksFeedService
    }

    public func loadFeed() {
        onLoadingStateChange?(true)
        stocksFeedService.load { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(stocks):
                self.onFeedLoadSuccess?(stocks)
                self.onFeedLoadError?(.none)
            case .failure:
                self.onFeedLoadError?("Failed to Load Feed")
            }
            self.onLoadingStateChange?(false)
        }
    }
}

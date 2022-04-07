# StocksFeedFeature

Stocks Feed Feature 
* Loads a feed of stocks from a remote data source via API call.
* It has the flexibility to be extended to load the feed of stocks from a local data source

About 
* This a platform agnostic feature layer and it does not have any UI code.
* Architecture is MVVM. View models are to be used by higher level layers to present the feed.

Warning 
* This is to be kept platform agnostic. No UIKit or SwiftUI code must be in this feature to keep coupling low and keep flexibility high

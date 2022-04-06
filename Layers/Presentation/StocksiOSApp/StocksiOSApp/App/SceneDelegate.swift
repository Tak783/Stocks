//
//  SceneDelegate.swift
//  StocksiOSApp
//
//  Created by Tak Mazarura on 05/04/2022.
//

import UIKit
import CoreNetworking
import StocksFeedFeature

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var client: HTTPClient?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            fatalError("Window failed to initialise in SceneDelegate")
        }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = accountsFeed()
        window?.makeKeyAndVisible()
    }
}

// MARK: - Navigation
extension SceneDelegate {
    private func accountsFeed() -> UIViewController {
        let client = URLSessionHTTPClient()
        self.client = client
        let stocksFeedService = RemoteStocksFeedService(client: client)
        let stocksFeedViewController = StocksFeedComposer.compose(
            with: stocksFeedService,
            title: "Stocks"
        )
        return stocksFeedViewController
    }
}

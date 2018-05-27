//
//  CoinData.swift
//  CryptoTracker
//
//  Created by Dave on 5/26/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import UIKit

struct CoinData {
    
    let symbols = ["BTC", "ETH", "LTC"]
    var coins = [Coin]()
    
    mutating func getCoinData(completion: @escaping (Error?) -> ()) {
//        CryptoCompare.getCoinData(symbols: symbols, onSuccess: { coins in
//            self.coins = coins
//            completion(nil)
//        }, onError: { error in
//            completion(error)
//            print("error: \(error)")
//        })
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return coins.count
    }
    
    func symbol(for indexPath: IndexPath) -> String {
        return coins[indexPath.row].symbol
    }
    
    func image(for indexPath: IndexPath) -> UIImage {
        return coins[indexPath.row].image
    }
}

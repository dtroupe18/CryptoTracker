//
//  APIClient.swift
//  CryptoTracker
//
//  Created by Dave on 5/26/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import Foundation

protocol APIClient {
    typealias CoinCallBack = ([Coin]) -> Void
    typealias ErrorCallback = (Error) -> Void
    
    static func getCoinData(symbols: [String], onSuccess: CoinCallBack?, onError: ErrorCallback?)
}

//
//  CryptoCompare.swift
//  CryptoTracker
//
//  Created by Dave on 5/26/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import Foundation

class CryptoCompare: APIClient {
    
    
    static func getCoinData(symbols: [String], onSuccess: APIClient.CoinCallBack?, onError: APIClient.ErrorCallback?) {
        var baseURL = "https://min-api.cryptocompare.com/data/pricemulti?fsyms="
        let endURL = "&tsyms=USD"
        
        for symbol in symbols {
            if symbol != symbols.last {
                baseURL += symbol + ","
            } else {
                baseURL += symbol
            }
        }
        
        guard let url: URL = URL(string: baseURL + endURL) else {
            let urlError: Error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Error URL is not working!"]) as Error
            onError?(urlError)
            return
        }
        
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        let dataTask = defaultSession.dataTask(with: url, completionHandler: { data, response, error in
            
            if let error = error {
                onError?(error)
            } else if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                        print("json: \(json)")
                        
                        var coins: [Coin] = [Coin]()
                        for symbol in symbols {
                            if let dict = json[symbol] as? [String: Any] {
                                if let price = dict["USD"] as? Double {
                                    let currentCoin = Coin(symbol: symbol, price: price)
                                    coins.append(currentCoin)
                                }
                            }
                        }
                        onSuccess?(coins)
                    }
                } catch {
                    let jsonError: Error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Error data incorrectly formatted"]) as Error
                    onError?(jsonError)
                }
            }
        })
        dataTask.resume()
    }
}

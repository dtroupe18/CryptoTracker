//
//  Coin.swift
//  CryptoTracker
//
//  Created by Dave on 5/26/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import UIKit

struct Coin {
    
    var symbol = ""
    var image = UIImage()
    var price = 0.0
    var amount = 0.0
    var histroricalData = [Double]()
    
    init(symbol: String, price: Double) {
        self.symbol = symbol
        self.price = price
        
        if let image = UIImage(named: symbol) {
            self.image = image
        }
    }
    
    
    
}

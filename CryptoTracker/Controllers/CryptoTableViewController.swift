//
//  CryptoTableViewController.swift
//  CryptoTracker
//
//  Created by Dave on 5/26/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import UIKit

class CryptoTableViewController: UITableViewController {
    
    var coinData = CoinData()

    override func viewDidLoad() {
        super.viewDidLoad()
//        coinData.getCoinData {
//            
//        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return coinData.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinData.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = coinData.symbol(for: indexPath)
        cell.imageView?.image = coinData.image(for: indexPath)
        return cell
    }

}

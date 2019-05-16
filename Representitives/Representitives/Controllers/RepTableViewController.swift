//
//  RepTableViewController.swift
//  Representitives
//
//  Created by William Moody on 5/16/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class RepTableViewController: UITableViewController {
    
    var state: String?
    
    var results: [SearchResults] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        title = state
        if let state = state {
            RepresentitiveController.fetchRep(state: state) { (results) in
                self.results = results
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepCell", for: indexPath) as? RepTableViewCell
        
        cell?.repResults = results[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
}

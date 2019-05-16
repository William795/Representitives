//
//  StateListViewController.swift
//  Representitives
//
//  Created by William Moody on 5/16/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class StateListViewController: UIViewController {
    
    @IBOutlet weak var stateTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension StateListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        let state = States.all[indexPath.row]
        
        cell.textLabel?.text = state
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stateSegue" {
            if let destinationVC = segue.destination as? RepTableViewController {
                if let indexPath = stateTableView.indexPathForSelectedRow {
                    let state = States.all[indexPath.row]
                    destinationVC.state = state
                }
            }
            
        }
    }
}

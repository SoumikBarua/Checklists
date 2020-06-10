//
//  AllListsViewController.swift
//  Checklists
//
//  Created by SB on 6/9/20.
//  Copyright © 2020 SB. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {

    let cellIdentifier = "ChecklistCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register a cell with this identifier for the table view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    // MARK: - Table view data source methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    // MARK: - Table view delegate methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        // Configure the cell...
        cell.textLabel!.text =  "List \(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowChecklist", sender: nil)
    }


}

//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by SB on 6/4/20.
//  Copyright © 2020 SB. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Turn off large navigation bar title
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK:- Table view delegate methods
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // MARK:- Actions
    // This will trigger going back to the main tableview without adding an item
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    // This will trigger going back to the main tableview after saving and addint to the item
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }

}

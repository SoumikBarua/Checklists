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
    var lists = [Checklist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register a cell with this identifier for the table view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // Since this is the root VC, set this to have the large titles
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Add placeholder data
        var list = Checklist(name: "Birthdays")
        lists.append(list)
        
        list = Checklist(name: "Groceries")
        lists.append(list)
        
        list = Checklist(name: "Cool apps")
        lists.append(list)
        
        list = Checklist(name: "To do")
        lists.append(list)
    }

    // MARK: - Table view data source methods
    // Return the number of rows for the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lists.count
    }

    // Provide a cell object for each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        // Configure the cell...
        let checklist = lists[indexPath.row]
        cell.textLabel!.text =  checklist.name
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    
    // MARK: - Table view delegate methods
    // Perform segue for individual Checklist whenever tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklist = lists[indexPath.row]
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
    
    // MARK: - Navigation
    // Pass the Checklist item to ChecklistVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as? Checklist
        }
    }


}

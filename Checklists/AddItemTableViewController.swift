//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by SB on 6/4/20.
//  Copyright © 2020 SB. All rights reserved.
//

import UIKit

protocol AddItemTableViewControllerDelegate: class {
    
    func addItemTableViewControllerDidCancel(_ controller: AddItemTableViewController)
    
    func addItemTableViewController(_ controller: AddItemTableViewController, didFinishAdding item: ChecklistItem)
    
    func addItemTableViewController(_ controller: AddItemTableViewController, didFinishEditing item: ChecklistItem)
}

class AddItemTableViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    var itemToEdit: ChecklistItem?
    
    weak var delegate: AddItemTableViewControllerDelegate?
    
    // MARK:- View life cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Turn off large navigation bar title
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK:- Table view delegate methods
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // MARK:- Actions
    // This will trigger going back to the main tableview without adding an item
    @IBAction func cancel() {
        delegate?.addItemTableViewControllerDidCancel(self)
    }
    
    // This will trigger going back to the main tableview after saving and addint to the item
    @IBAction func done() {
        
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.addItemTableViewController(self, didFinishEditing: item)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
        
            delegate?.addItemTableViewController(self, didFinishAdding: item)
        }
    }
    
    // MARK:- Text field delegate methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = !newText.isEmpty
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}

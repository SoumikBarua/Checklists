//
//  ChecklistItem.swift
//  Checklists
//
//  Created by SB on 6/2/20.
//  Copyright © 2020 SB. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    init(text: String, checked: Bool = false) {
        self.text = text
        self.checked = checked
        super.init()
    }
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
    
    func toggleChecked() {
        checked.toggle()
    }
}

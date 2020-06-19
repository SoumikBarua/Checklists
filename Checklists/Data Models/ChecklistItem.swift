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
    
    
    func toggleChecked() {
        checked.toggle()
    }
}

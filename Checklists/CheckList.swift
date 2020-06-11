//
//  CheckList.swift
//  Checklists
//
//  Created by SB on 6/9/20.
//  Copyright © 2020 SB. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    
    var name = ""
    
    init(name: String) {
        self.name = name
        super.init()
    }
}

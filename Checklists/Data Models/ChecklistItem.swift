//
//  ChecklistItem.swift
//  Checklists
//
//  Created by SB on 6/2/20.
//  Copyright © 2020 SB. All rights reserved.
//

import Foundation
import UserNotifications

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
    
    func scheduleNotification() {
        if shouldRemind && dueDate > Date() {
            let content = UNMutableNotificationContent()
            content.title = "Reminder:"
            content.body = text
            content.sound = UNNotificationSound.default
            
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: dueDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(identifier: "\(itemID)", content: content, trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            center.add(request)
            
            print("Scheduled \(request) for itemID \(itemID)")
            
        }
    }
}

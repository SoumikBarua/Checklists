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
    
    // Called when a checklist item is either deleted by a swipe or when the checklist it's a part of is deleted
    deinit {
        removeNotification()
    }
    
    func toggleChecked() {
        checked.toggle()
    }
    
    // Create notifications if the reminder toggle is on and the due date is in the future
    func scheduleNotification() {
        removeNotification() // for new notifications, delete any existing notifications
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
    
    // Cancel the reminder notification if the toggle is switched off
    func removeNotification() {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["\(itemID)"])
    }
    
}

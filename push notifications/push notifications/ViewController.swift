//
//  ViewController.swift
//  push notifications
//
//  Created by Mac on 02/12/2022.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        registerLocalNotification()
    
    }
    
    func registerLocalNotification() {
        
        UNUserNotificationCenter.current().delegate = self
        let centre = UNUserNotificationCenter.current()
        centre.requestAuthorization(options: [.badge, .alert
                                              , .sound]) { granted, error in
            if error == nil {
                print("user is granted \(granted)")
            }
        }
        let content = UNMutableNotificationContent()
        content.title = "Hello Chi"
        content.body = "Kindly see the attached offer letter of employment, acknowledge and sign"
        content.sound = .default
        content.userInfo = ["value": "Data with local notification"]
        
        
        let date = Date().addingTimeInterval(20)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        
        
        centre.add(request) { (error) in
            if error != nil {
                print("Error = \(error?.localizedDescription ?? "error local notification")")
            }
        }
        
        
    }

}


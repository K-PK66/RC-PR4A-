//
//  NotificationBuilder.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/7/19.
//

import Foundation
import UserNotifications
import SwiftUI

class NotificationBuilder {

    
    static func launcher() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let medicines = (try? context.fetch(MedicineAlarm.fetchRequest(.all))) ?? []
        
        for medicine in medicines {
            for pill in medicine.alarm {
                buildNotification(time: pill.time, medicine: medicine)
            }
        }
        
    }
    
    static func buildNotification(time: Date, medicine: MedicineAlarm) {
        let content = UNMutableNotificationContent()
        content.title = "吃药提醒"
        content.subtitle = medicine.name + ", " + medicine.pillTypeNotes
        if (medicine.notes != "") {
            content.subtitle += (", " + medicine.notes)
        }
        
        let time = timeTransformer(time: time)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    static func timeTransformer(time: Date) -> DateComponents {
        var components = DateComponents()
        let formatter = DateFormatter()
        formatter.dateFormat = "mm"
        let hour = Int(formatter.string(from: time))
        formatter.dateFormat = "ss"
        let minute = Int(formatter.string(from: time))
        components.hour = hour
        components.minute = minute
        return components
        
    }
    
    static func test() {
        let content = UNMutableNotificationContent()
        content.title = "吃药提醒"
        content.subtitle = "阿司匹林"
        
        var time = DateComponents()
        time.hour = 17
        time.minute = 25
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        
    }
}

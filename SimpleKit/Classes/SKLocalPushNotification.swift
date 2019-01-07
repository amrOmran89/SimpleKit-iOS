//
//  File.swift
//  Pods
//
//  Created by Amr Omran on 12/27/2018.
//

import Foundation
import UserNotifications


public class SKLocalPushNotification {
    
    
    private init() {}
    
    public static let shared = SKLocalPushNotification()
    
    public func createNotification(center: UNUserNotificationCenter, skNotificationModel: SKNotificationModel) {
        
        // notification content
        let content = UNMutableNotificationContent()
        content.title = skNotificationModel.title
        content.subtitle = skNotificationModel.subTitle
        content.body = skNotificationModel.body
        content.sound = UNNotificationSound.default()
        
//        UNTimeIntervalNotificationTrigger
//        UNCalendarNotificationTrigger
//        UNLocationNotificationTrigger
        

        if let url = skNotificationModel.attachmentUrl {
            if let attachments = try? UNNotificationAttachment(identifier: skNotificationModel.attachmentIdentifier,
                                                               url: url,
                                                               options: nil) {
                content.attachments = [attachments]
            }
        }
        
        
        // notification trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: skNotificationModel.timeInterval,
                                                        repeats: skNotificationModel.repeats)
        
        // request to display
        let request = UNNotificationRequest(identifier: skNotificationModel.notificationIdentifier,
                                            content: content,
                                            trigger: trigger)
        
        // notification action
        let dismiss = UNNotificationAction(identifier: skNotificationModel.dismissActionTitle,
                                           title: skNotificationModel.dismissActionTitle,
                                           options: .destructive)
        
        // notification category for actions
        let generalCategory = UNNotificationCategory(identifier: skNotificationModel.categoryIdentifiers,
                                                     actions: [dismiss],
                                                     intentIdentifiers: [],
                                                     options: [.customDismissAction])
        
        center.setNotificationCategories([generalCategory])
        
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}


//
//  NotificationHandler.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 08.01.2022.
//

import UserNotifications

struct NotificationName
{
    public static let vocabularyCheck = "check.vocabulary"
}

class NotificationService: NSObject, UNUserNotificationCenterDelegate
{
        /** Handle notification when app is in background */
        func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response:
            UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
            
            let notiName = Notification.Name(response.notification.request.identifier)
            NotificationCenter.default.post(name:notiName , object: response.notification.request.content)
            completionHandler()
        }
}

extension NotificationService  {
    func requestPermissionAndSetDelegate(_ delegate : UNUserNotificationCenterDelegate? = nil ,
        onDeny handler :  (()-> Void)? = nil) {
        let center = UNUserNotificationCenter.current()
        
        center.getNotificationSettings(completionHandler: { settings in
        
            if settings.authorizationStatus == .denied {
                if let handler = handler {
                    handler()
                }
                return
            }
            
            if settings.authorizationStatus != .authorized  {
                center.requestAuthorization(options: [.alert, .sound, .badge]) {
                    _ , error in
                    
                    if let error = error {
                        print("error handling \(error)")
                    }
                }
            }
            
        })
        center.delegate = delegate ?? self
    }
}

extension NotificationService {
    func addNotification(id : String, title : String, subtitle : String ,
    sound : UNNotificationSound = UNNotificationSound.default,
    trigger : UNNotificationTrigger =
    UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        
        content.sound = sound

        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }

    func removeNotifications(_ ids: [String]){
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ids)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ids)
    }
    
    func hasPendingNotification(_ id: String) -> Bool
    {
        var hasNotification = false
        UNUserNotificationCenter.current().getPendingNotificationRequests { notifications in
            for notification in notifications {
                if (notification.identifier == id ) {
                    hasNotification = true
                    return
                }
            }
        }
        return hasNotification
    }
}

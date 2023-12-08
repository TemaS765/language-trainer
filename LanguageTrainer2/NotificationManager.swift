//
//  NotificationManager.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 08.01.2022.
//

import Foundation
import UserNotifications

protocol NotificationManagerProtocol {
    func addNotifyForVocabularyCheckIfNotAdded() -> Void
}

final class NotificationManager: NotificationManagerProtocol
{
    private let notifyService: NotificationService
    
    init(notificationService: NotificationService)
    {
        notifyService = notificationService
    }
    
    func addNotifyForVocabularyCheckIfNotAdded() -> Void
    {
        let notifyName = NotificationName.vocabularyCheck
        let hasNotification = notifyService.hasPendingNotification(notifyName)
        
        if (hasNotification) {
            return
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60 * 30, repeats: false)
        
        notifyService.addNotification(id: notifyName, title: "Vocabulary check", subtitle: "Check your vocabulary", sound: .default, trigger: trigger)
    }
}

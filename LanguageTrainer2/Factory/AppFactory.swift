//
//  AppServices.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 09.01.2022.
//

import Foundation

final class AppFactory: AppFactoryProtocol
{
    var wordService: WordServiceProtocol
    var notificationService: NotificationService
    var notificationManger: NotificationManagerProtocol
    
    fileprivate init()
    {
        self.wordService = CoreDataWordService()
        let notifyService = NotificationService()
        self.notificationService = notifyService
        self.notificationManger = NotificationManager(notificationService: notifyService)
    }
}

let appFactory = AppFactory()

//
//  Services.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 09.01.2022.
//

import Foundation

protocol AppFactoryProtocol
{
    var wordService: WordServiceProtocol { get }
    var notificationService: NotificationService { get }
    var notificationManger: NotificationManagerProtocol { get }
}

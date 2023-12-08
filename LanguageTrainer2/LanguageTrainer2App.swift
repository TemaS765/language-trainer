//
//  LanguageTrainer2App.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 06.01.2022.
//

import SwiftUI

@main
struct LanguageTrainer2App: App {
    let router = ScreenRouter(ScreenRoute.mainScreen)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .onAppear {
                    appFactory.notificationService.requestPermissionAndSetDelegate()
                    appFactory.notificationManger.addNotifyForVocabularyCheckIfNotAdded()
                }
                .onReceive(
                    NotificationCenter.default.publisher(for: Notification.Name(NotificationName.vocabularyCheck))
                ) { _ in
                    router.curentScreen = .vocabularyCheck
                    appFactory.notificationManger.addNotifyForVocabularyCheckIfNotAdded()
                }
            
        }
    }
}


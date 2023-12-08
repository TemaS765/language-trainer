//
//  ContentView.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 06.01.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: ScreenRouter
    
    var body: some View {
        switch router.curentScreen {
        case .mainScreen:
            screenFactory.makeMainScreen()
        case .wordListScreen:
            screenFactory.makeWordListScreen()
        case .addWordScreen:
            screenFactory.makeAddWordScreen()
        case .editWordScreen(let word):
            screenFactory.makeEditWordScreen(word)
        case .checkYourSelf:
            screenFactory.makeCheckYourSelfScreen()
        case .vocabularyCheck:
            screenFactory.makeVocabularyCheckScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

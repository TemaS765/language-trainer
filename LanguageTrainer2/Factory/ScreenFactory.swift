//
//  ApplicationFactory.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import Foundation

protocol ScreenFactoryProtocol {
    func makeMainScreen() -> MainScreen
    func makeWordListScreen() -> WordListScreen
    func makeAddWordScreen() -> AddWordScreen
    func makeEditWordScreen(_ word: Word) -> EditWordScreen
    func makeCheckYourSelfScreen() -> CheckYourSelfScreen
    func makeVocabularyCheckScreen() -> VocabularyCheckScreen
}

final class ScreenFactory: ScreenFactoryProtocol {
    
    private let factory: AppFactoryProtocol
    
    fileprivate init(){
        self.factory = appFactory
    }
    
    func makeMainScreen() -> MainScreen {
        return MainScreen(viewModel: MainScreenViewModel(wordService: self.factory.wordService))
    }
    
    func makeWordListScreen() -> WordListScreen {
        return WordListScreen(
            viewModel: WordListViewModel(wordService: self.factory.wordService)
        )
    }
    
    func makeAddWordScreen() -> AddWordScreen {
        return AddWordScreen(viewModel: AddWordViewModel(wordService: self.factory.wordService))
    }
    
    func makeEditWordScreen(_ word: Word) -> EditWordScreen {
        return EditWordScreen(viewModel: EditWordViewModel(word: word, wordService: self.factory.wordService))
    }
    
    func makeCheckYourSelfScreen() -> CheckYourSelfScreen {
        return CheckYourSelfScreen(viewModel: CheckYourSelfViewModel(wordService: self.factory.wordService))
    }
    
    func makeVocabularyCheckScreen() -> VocabularyCheckScreen {
        return VocabularyCheckScreen(viewModel: VocabularyCheckViewModel(wordService: self.factory.wordService))
    }
}

let screenFactory: ScreenFactoryProtocol = ScreenFactory()

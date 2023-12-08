//
//  WordListViewModel.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import Foundation

class WordListViewModel: ObservableObject {
    private let wordService: WordServiceProtocol
    
    @Published
    var words: [Word] = []
    
    init(wordService: WordServiceProtocol) {
        self.wordService = wordService
        self.words = wordService.list()
    }
    
    func deleteWord(word: Word) {
        wordService.delete(word)
        words = wordService.list()
    }
}

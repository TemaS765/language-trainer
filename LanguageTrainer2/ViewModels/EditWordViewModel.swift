//
//  EditWordViewModel.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import Foundation

class EditWordViewModel: ObservableObject
{
    private let wordService: WordServiceProtocol
    private let id: Int64
    @Published var text: String
    @Published var translate: String
    @Published var alertItem: AlertItem?
    
    init(word: Word, wordService: WordServiceProtocol) {
        self.wordService = wordService
        id = word.id
        text = word.text
        translate = word.translate
    }
    
    func editWord() -> Bool
    {
        let editWord = Word(id: id, text: text, translate: translate),
            existId = wordService.findByText(editWord.text)?.id
        if existId != nil && existId != editWord.id {
            alertItem = AlertItem(title: "Error edit word", message: "Word \(text) already exists!")
            return false
        }
        wordService.edit(editWord)
        return true
    }
}

//
//  AddWordViewModel.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import Foundation
import SwiftUI

class AddWordViewModel: ObservableObject
{
    private let wordService: WordServiceProtocol
    
    @Published var text: String = ""
    @Published var translate: String = ""
    @Published var alertItem: AlertItem?
    
    init(wordService: WordServiceProtocol) {
        self.wordService = wordService
    }
    
    func addWord() -> Bool
    {
        let word = Word(
            id: 0,
            text: text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines),
            translate: translate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        )
        if (wordService.findByText(word.text) != nil) {
            alertItem = AlertItem(title: "Error adding word", message: "Word \(text) already exists!")
            return false
        }
        wordService.add(word)
        return true
    }
}

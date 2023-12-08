//
//  CheckYourSelfViewModel.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import Foundation

enum CheckType: CaseIterable
{
    case text
    case translate
}

enum WorkMode
{
    case check
    case execution
}

class CheckYourSelfViewModel: ObservableObject
{
    private let wordService: WordServiceProtocol
    private var wordIterator: IndexingIterator<[Word]>
    
    var wordsLeft: Int
    var wordsChecked: Int
    var checkType: CheckType = .text
    var workMode: WorkMode
    
    var currentWord: Word?
    var text: String = ""
    var translate: String = ""
    
    var isErrorCheck: Bool = false
    var isCheckEnded: Bool = false
    
    @Published var redrawScreenToggle: Bool = false
    
    init(wordService: WordServiceProtocol) {
        self.wordService = wordService
        var words = self.wordService.list()
        words.shuffle()
        self.wordsLeft = words.count
        self.wordsChecked = 0
        self.wordIterator = words.makeIterator()
        self.workMode = .execution
        self.nextWord()
    }
    
    func redrawSereen()
    {
        self.redrawScreenToggle.toggle()
    }
    
    func nextWord()
    {
        let nextWord = wordIterator.next()
        if nextWord != nil  {
            self.text = nextWord!.text
            self.fillCheckAttributesByWord(nextWord!)
            self.isCheckEnded = false
        } else {
            self.isCheckEnded = true
        }
        self.currentWord = nextWord
        self.workMode = .execution
    }
    
    private func fillCheckAttributesByWord(_ word: Word) -> Void
    {
        self.checkType = CheckType.allCases.randomElement()!
        
        switch self.checkType {
        case .text:
            self.text = ""
            self.translate = word.translate
        case .translate:
            self.text = word.text
            self.translate = ""
        }
    }
    
    func check()
    {
        if self.currentWord != nil {
            switch self.checkType {
            case .text:
                if self.text.lowercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == self.currentWord!.text.lowercased() {
                    self.isErrorCheck = false
                } else {
                    self.isErrorCheck = true
                }
            case .translate:
                if self.translate.lowercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == self.currentWord!.translate.lowercased() {
                    self.isErrorCheck = false
                } else {
                    self.isErrorCheck = true
                }
            }
            self.wordsLeft -= 1
            self.wordsChecked += 1
            self.workMode = .check
            if self.wordsLeft < 1 {
                self.isCheckEnded = true
            }
        }
    }
}

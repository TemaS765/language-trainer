//
//  MemoryRepository.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import Foundation

final class TemporyWordService: WordServiceProtocol {
    
    private var autoIncrement: Int64 = 1;
    private var words: [Word] = []
    
    func get(id: Int64) -> Word?
    {
        for word in words {
            if word.id == id {
                return word
            }
        }
        return nil
    }
    
    func list() -> [Word]
    {
        return words
    }
    
    func add(_ item: Word) -> Void
    {
        let id = autoIncrement
        let word = Word(id: id, text: item.text, translate: item.translate)
        words.append(word)
        autoIncrement += 1
    }
    
    func delete(_ item: Word) -> Void
    {
        var removeIndexes: IndexSet = IndexSet()
        for (index, word) in words.enumerated() {
            if word.id == item.id {
                removeIndexes.insert(index)
            }
        }
        if !removeIndexes.isEmpty {
            words.remove(atOffsets: removeIndexes)
        }
    }
    
    func edit(_ item: Word) -> Void
    {
        var editIndexes: IndexSet = IndexSet();
        for (index, word) in words.enumerated() {
            if word.id == item.id {
                editIndexes.insert(index)
            }
        }
        if !editIndexes.isEmpty {
            for index in editIndexes {
                let editWord = words[index]
                words[index] = Word(id: editWord.id, text: item.text, translate: item.translate)
            }
        }
    }
    
    func findByText(_ text: String) -> Word? {
        for word in words {
            if word.text == text {
                return word
            }
        }
        return nil
    }
}

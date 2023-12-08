//
//  Word.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import Foundation

struct Word: Codable, Identifiable {
    let id: Int64
    let text: String
    let translate: String
    
    static let example = Word(id: 0, text: "Example", translate: "Пример")
}

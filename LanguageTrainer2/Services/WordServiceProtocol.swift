//
//  Repository.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import Foundation

protocol WordServiceProtocol {
    func get(id: Int64) -> Word?
    func list() -> [Word]
    func add(_ item: Word) -> Void
    func delete(_ item: Word) -> Void
    func edit(_ item: Word) -> Void
    func findByText(_ text: String) -> Word?
}

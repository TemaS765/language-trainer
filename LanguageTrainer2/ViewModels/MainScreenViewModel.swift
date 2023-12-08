//
//  MainScreenViewModel.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 09.01.2022.
//

import Foundation
import SwiftUI

class MainScreenViewModel: ObservableObject
{
    @Published var hasWords: Bool
    
    init(wordService: WordServiceProtocol) {
        hasWords = !wordService.list().isEmpty
    }
}

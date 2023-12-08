//
//  VacobularyCheckViewModel.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 09.01.2022.
//

import Foundation

enum VacobularyCheckType: CaseIterable {
    case text
    case translate
}

class VocabularyCheckViewModel: ObservableObject
{
    let word: Word?
    let checkType: VacobularyCheckType
    var isErrorCheck: Bool = false
    var isChecked: Bool = false
    
    var text = ""
    var translate = ""
    
    @Published var redrawScreenToggle: Bool = false
    
    init(wordService: WordServiceProtocol)
    {
        self.word = wordService.list().shuffled().first
        self.checkType = VacobularyCheckType.allCases.randomElement()!
        self.fillChekComponents()
    }
    
    func fillChekComponents() -> Void
    {
        switch self.checkType {
        case .text:
            text = ""
            translate = word?.translate ?? ""
        case .translate:
            text = word?.text ?? ""
            translate = ""
        }
    }
    
    func check() -> Void
    {
        switch checkType {
        case .text:
            guard let text = word?.text else {
                isErrorCheck = true
                break
            }
            isErrorCheck = (text.lowercased() != self.text.lowercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
            if isErrorCheck {
                self.text = self.word!.text
            }
        case .translate:
            guard let translate = word?.translate else {
                isErrorCheck = true
                break
            }
            isErrorCheck = (translate.lowercased() != self.translate.lowercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
            if isErrorCheck {
                self.translate = self.word!.translate
            }
        }
        
        isChecked = true
    }
    
    func redrawSecreen()
    {
        self.redrawScreenToggle.toggle()
    }
}

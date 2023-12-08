//
//  VacobularyCheckScreen.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 09.01.2022.
//

import SwiftUI

struct VocabularyCheckScreen: View {
    @EnvironmentObject var router: ScreenRouter
    @ObservedObject var viewModel: VocabularyCheckViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "clear")
                    .padding()
                    .onTapGesture {
                        router.curentScreen = .mainScreen
                    }
            }
            Spacer()
            Text("VOCABULARY CHECK")
            Spacer()
            VStack {
                if viewModel.isChecked {
                    switch viewModel.checkType {
                    case .translate:
                        GeneralTextField(label: "word", text: $viewModel.text).padding().disabled(true)
                        if viewModel.isErrorCheck {
                            ErrorGeneralTextField(label: "translate", text: $viewModel.translate).padding().disabled(true)
                        } else {
                            SuccessGeneralTextField(label: "translate", text: $viewModel.translate).padding().disabled(true)
                        }
                    case .text:
                        if viewModel.isErrorCheck {
                            ErrorGeneralTextField(label: "word", text: $viewModel.text).padding().disabled(true)
                        } else {
                            SuccessGeneralTextField(label: "word", text: $viewModel.text).padding().disabled(true)
                        }
                        GeneralTextField(label: "translate", text: $viewModel.translate).padding().disabled(true)
                    }
                } else {
                    GeneralTextField(label: "word", text: $viewModel.text).padding()
                    GeneralTextField(label: "translate", text: $viewModel.translate).padding()
                }
            }
            Spacer()
            if !viewModel.isChecked {
                Button("CHECK"){
                    viewModel.check()
                    viewModel.redrawSecreen()
                }.padding(10)
                    .buttonStyle(GeneralButtonStyle())
            }
            Spacer()
        }
    }
}

struct VocabularyCheckScreen_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.makeVocabularyCheckScreen()
    }
}

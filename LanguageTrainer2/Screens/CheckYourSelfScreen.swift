//
//  CheckYourSelfScreen.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import SwiftUI

struct CheckYourSelfScreen: View {
    @EnvironmentObject var router: ScreenRouter
    @ObservedObject var viewModel: CheckYourSelfViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image("BackIcon")
                    .padding()
                    .frame(width: 10.77, height: 20)
                    .onTapGesture {
                        router.curentScreen = .mainScreen
                    }
                Spacer()
                Text("\(viewModel.wordsChecked)/\(viewModel.wordsLeft)")
                Spacer()
                Image("CloseIcon")
                    .frame(width: 20, height: 20)
                    .padding()
                    .onTapGesture {
                        router.curentScreen = .mainScreen
                    }
            }
            Spacer()
            Text("CHECK YOURSELF")
            Spacer()
            VStack {
                if viewModel.workMode == .check {
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
            if viewModel.isCheckEnded == false {
                switch viewModel.workMode {
                case .execution:
                    Button("CHECK"){
                        viewModel.check()
                        viewModel.redrawSereen()
                    }.padding(10)
                        .buttonStyle(GeneralButtonStyle())
                case .check:
                    Button("NEXT"){
                        viewModel.nextWord()
                        viewModel.redrawSereen()
                    }.padding(10)
                        .buttonStyle(GeneralButtonStyle())
                }
            }
            Spacer()
        }
    }
}

struct CheckYourSelfScreen_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.makeCheckYourSelfScreen()
    }
}

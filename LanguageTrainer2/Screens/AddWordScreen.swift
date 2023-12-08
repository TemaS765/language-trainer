//
//  AddWordScreen.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import SwiftUI

struct AddWordScreen: View {
    @EnvironmentObject var router: ScreenRouter
    @ObservedObject var viewModel: AddWordViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image("CloseIcon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                    .onTapGesture {
                        router.curentScreen = .wordListScreen
                    }
            }
            
            Text("NEW WORD")
            GeneralTextField(label: "Word", text: $viewModel.text)
                .padding()
            GeneralTextField(label: "Translate", text: $viewModel.translate)
                .padding()
            Button("ADD"){
                if viewModel.addWord() {
                    router.curentScreen = .wordListScreen
                }
            }
            .buttonStyle(GeneralButtonStyle())
            .padding()
            Spacer()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: Text(alertItem.title), message: Text(alertItem.message))
        }
        
    }
}

struct AddWordScreen_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.makeAddWordScreen()
    }
}

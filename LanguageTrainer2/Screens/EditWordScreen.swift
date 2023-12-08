//
//  EditWordScreen.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import SwiftUI

struct EditWordScreen: View {
    @EnvironmentObject var router: ScreenRouter
    @ObservedObject var viewModel: EditWordViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image("BackIcon")
                    .resizable()
                    .frame(width: 10.77, height: 20)
                    .padding()
                    .onTapGesture {
                        router.curentScreen = .wordListScreen
                    }
                Spacer()
                Image("CloseIcon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                    .onTapGesture {
                        router.curentScreen = .wordListScreen
                    }
            }
            
            Text("EDITING")
            GeneralTextField(label: "Word", text: $viewModel.text)
                .padding()
            GeneralTextField(label: "Translate", text: $viewModel.translate)
                .padding()
            Button("EDIT"){
                if viewModel.editWord() {
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

struct EditWordScreen_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.makeEditWordScreen(Word(id: 1, text: "Text", translate: "Translate"))
    }
}

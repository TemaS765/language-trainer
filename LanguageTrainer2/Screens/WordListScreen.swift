//
//  WordListScreen.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import SwiftUI

struct WordListScreen: View {
    @EnvironmentObject var router: ScreenRouter
    @ObservedObject var viewModel: WordListViewModel
    
    var body: some View {
        VStack {
            Spacer().frame(height:30)
            HStack() {
                Spacer()
                Image("CloseIcon")
                    .onTapGesture {
                        router.curentScreen = .mainScreen
                    }
                    .frame(width: 20, height: 20)
                Spacer().frame(width: 20)
            }
            HStack {
                Spacer().frame(width: 20)
                Text("ADD").onTapGesture {
                    router.curentScreen = .addWordScreen
                }.foregroundColor(Color("PrimaryColor"))
                    .font(Font.custom("Poppins", size:16))
                HStack() {
                    Text("MY WORDS").foregroundColor(Color(red: 0.26, green: 0.32, blue: 0.38))
                        .font(Font.custom("Poppins", size:24))
                        
                }.frame(maxWidth: .infinity)
            }
            HStack {
                List(viewModel.words) { word in
                    WordListItem(text: word.text, translate: word.translate,
                        editAction: {
                        router.curentScreen = .editWordScreen(word)
                        },
                        deleteAction: {
                            viewModel.deleteWord(word: word)
                        }
                    )
                }
            }
        }.navigationBarHidden(true)
    }
}

struct WordListScreen_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.makeWordListScreen()
    }
}


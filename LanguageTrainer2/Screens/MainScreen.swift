//
//  MainPage.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var router: ScreenRouter
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 0){
                Image("Main")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 372.6, height: 342)

                if (viewModel.hasWords) {
                    Button("LEARN"){
                        
                    }.padding(10)
                    .buttonStyle(GeneralButtonStyle())
                }
                if (viewModel.hasWords) {
                    Button("CHECK YOURSELF"){
                        router.curentScreen = .checkYourSelf
                    }.padding(10)
                    .buttonStyle(GeneralButtonStyle())
                }
                Button("ADD THE WORDS"){
                    router.curentScreen = .addWordScreen
                }.padding(10)
                .buttonStyle(GeneralButtonStyle())
                
                if (viewModel.hasWords) {
                    Button("MY WORDS")
                    {
                        router.curentScreen = .wordListScreen
                    }
                    .padding(10)
                    .buttonStyle(GeneralButtonStyle())
                }
            }.padding(.top, -100)
        }
        .navigationBarHidden(true)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.makeMainScreen()
    }
}

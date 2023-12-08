//
//  Router.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import SwiftUI

class ScreenRouter: ObservableObject
{
    @Published var curentScreen: ScreenRoute
    
    init(_ startRoute: ScreenRoute)
    {
        curentScreen = startRoute
    }
}

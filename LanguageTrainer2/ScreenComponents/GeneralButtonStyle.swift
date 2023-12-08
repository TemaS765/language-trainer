//
//  GeneralButtonStyle.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import SwiftUI

struct GeneralButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 16))
            .frame(maxWidth: .infinity)
            .background(Color(red: 77/255, green: 98/255, blue: 160/255))
            .opacity(configuration.isPressed ? 1 : 0.7)
            .cornerRadius(10)
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Preview button"){}
        .buttonStyle(GeneralButtonStyle())
    }
}

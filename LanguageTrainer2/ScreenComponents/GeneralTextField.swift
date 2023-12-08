//
//  GeneralTextField.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import SwiftUI

struct GeneralTextField: View {
    let label: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            TextField(label, text: $text)
            Rectangle()
            .frame(height: 1)
            .foregroundColor(Color(red: 118/255, green: 118/255, blue: 118/255))
            .disableAutocorrection(true)
            
        }
    }
}

struct GeneralTextField_Previews: PreviewProvider {
    @State static var text: String = "text"
    
    static var previews: some View {
        GeneralTextField(label: "Label", text: $text)
    }
}

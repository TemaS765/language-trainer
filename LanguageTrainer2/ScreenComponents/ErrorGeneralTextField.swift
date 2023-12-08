//
//  ErrorTextField.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import SwiftUI

struct ErrorGeneralTextField: View {
    let label: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            TextField(label, text: $text)
                .foregroundColor(.red)
            Rectangle()
            .frame(height: 1)
            .foregroundColor(.red)
            
        }
    }
}

struct ErrorGeneralTextField_Previews: PreviewProvider {
    @State static var text: String = "text"
    
    static var previews: some View {
        ErrorGeneralTextField(label: "Label", text: $text)
    }
}

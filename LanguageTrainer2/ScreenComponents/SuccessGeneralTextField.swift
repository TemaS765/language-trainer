//
//  SuccessTextField.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import SwiftUI

struct SuccessGeneralTextField: View {
    let label: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            TextField(label, text: $text)
                .foregroundColor(.green)
            Rectangle()
            .frame(height: 1)
            .foregroundColor(.green)
            
        }
    }
}

struct SuccessGeneralTextField_Previews: PreviewProvider {
    @State static var text: String = "text"
    
    static var previews: some View {
        SuccessGeneralTextField(label: "Label", text: $text)
    }
}

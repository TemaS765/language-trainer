//
//  WordListItem.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import SwiftUI

struct WordListItem: View {
    let text: String
    let translate: String
    let editAction: () -> Void
    let deleteAction: () -> Void
    
    var body: some View {
        HStack {
            Text(text)
            Spacer().frame(width: 30)
            Text(translate)
            Spacer()
            Image("PencilIcon")
                .onTapGesture {
                    editAction()
                }
                .frame(width: 20, height: 20)
            Spacer().frame(width: 20)
            Image("CloseIcon").onTapGesture {
                deleteAction()
            }.frame(width: 20, height: 20)
        }.padding()
    }
}

struct WordListItem_Previews: PreviewProvider {
    static var previews: some View {
        WordListItem(
            text: "Example",
            translate: "Пример",
            editAction: {},
            deleteAction: {}
        )
    }
}

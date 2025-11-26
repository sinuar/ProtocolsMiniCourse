//
//  AddToDoView.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 25/11/25.
//

import SwiftUI

struct AddToDoView: View {
    @State private var title: String = ""
    let onAdd: (String) -> Void
    
    var body: some View {
        HStack {
            TextField("New ToDo", text: $title)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button(action: {
                guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                onAdd(title)
                title = ""
            }) {
                Image(systemName: "plus")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

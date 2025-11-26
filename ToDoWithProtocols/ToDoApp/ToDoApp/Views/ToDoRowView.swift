//
//  ToDoRowView.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 25/11/25.
//

import SwiftUI

struct ToDoRowView: View {
    let toDo: ToDo
    let toggle: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: toDo.isDone ? "checkmark.circle.fill" : "circle")
                .onTapGesture(perform: toggle)
            Text(toDo.title)
            Spacer()
        }
        .contentShape(Rectangle())
        .padding(.vertical, 8)
    }
}


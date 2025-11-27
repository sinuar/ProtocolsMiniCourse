//
//  Models.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 25/11/25.
//

import Foundation

struct ToDo: Identifiable, Equatable {
    var id: UUID
    var title: String
    var isDone: Bool
    
    init(id: UUID = .init(), title: String, isDone: Bool = false) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
}

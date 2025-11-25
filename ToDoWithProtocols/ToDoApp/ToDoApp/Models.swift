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
    var isCompleted: Bool
    
    init(id: UUID, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}

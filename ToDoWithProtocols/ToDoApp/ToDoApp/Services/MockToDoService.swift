//
//  MockToDoService.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 25/11/25.
//

import Foundation
// MockTodoService.swift (for previews & tests)

@MainActor
struct MockToDoService: ToDoServiceProtocol {
    var toDos: [ToDo]
    
    init(toDos: [ToDo] = [
        ToDo(title: "Mock 1"),
        ToDo(title: "Mock 2")
    ]) {
        self.toDos = toDos
    }
    
    func fetchToDos() async throws -> [ToDo] { toDos }
    func addToDo(_ toDo: ToDo) async throws { /* no-op */ }
    func updateToDo(_ toDo: ToDo) async throws { /* no-op */ }
    func deleteToDo(_ id: UUID) async throws { /* no-op */ }
}

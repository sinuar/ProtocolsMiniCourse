//
//  RealToDoService.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 25/11/25.
//

import Foundation

// RealTodoService.swift (simple in-memory implementation, replaceable with persistence later)

actor RealToDoService: ToDoServiceProtocol {
    private var store: [ToDo] = [
        ToDo(title: "Buy milk"),
        ToDo(title: "Walk the dog")
    ]
    
    func fetchToDos() async throws -> [ToDo] {
        // simulate latency
        try await Task.sleep(for: .seconds(1))
        return store
    }
    
    func addToDo(_ toDo: ToDo) async throws {
        store.append(toDo)
    }
    
    func updateToDo(_ toDo: ToDo) async throws {
        guard let index = store.firstIndex(where: { $0.id == toDo.id })
        else { return }
        store[index] = toDo
    }
    
    func deleteToDo(_ id: UUID) async throws {
        store.removeAll { $0.id == id }
    }
}

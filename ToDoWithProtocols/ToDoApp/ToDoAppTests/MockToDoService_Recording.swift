//
//  MockToDoService_Recording.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 27/11/25.
//

import Foundation

@MainActor
final class MockToDoService_Recording: ToDoServiceProtocol {
    var toDos: [ToDo]
    
    // Spies
    private(set) var didCallFetch = false
    private(set) var addedItems: [ToDo] = []
    private(set) var updatedItems: [ToDo] = []
    private(set) var deletedIds: [UUID] = []
    
    init(toDos: [ToDo] = [
        ToDo(title: "Mock 1"),
        ToDo(title: "Mock 2")
    ]) {
        self.toDos = toDos
    }
    
    func fetchToDos() async throws -> [ToDo] {
        didCallFetch = true
        return toDos
    }
    
    func addToDo(_ toDo: ToDo) async throws {
        addedItems.append(toDo)
        toDos.append(toDo)
    }
    
    func updateToDo(_ toDo: ToDo) async throws {
        updatedItems.append(toDo)
    }
    
    func deleteToDo(_ id: UUID) async throws {
        deletedIds.append(id)
    }
}

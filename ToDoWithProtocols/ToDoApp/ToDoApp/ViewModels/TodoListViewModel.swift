//
//  ToDoListViewModel.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 25/11/25.
//

import Foundation

@MainActor
final class ToDoListViewModel: ObservableObject, ToDoListViewModelProtocol {
    @Published private(set) var toDos: [ToDo] = []
    @Published private(set) var isLoading: Bool = false
    
    private let service: ToDoServiceProtocol
    
    init(service: ToDoServiceProtocol) {
        self.service = service
    }
    
    func load() async {
        isLoading = true
        defer { isLoading = false }
        do {
            toDos = try await service.fetchToDos()
        } catch {
            // handle error: for this mini project, we'll just print
            print("Failed to load To Dos:", error)
            toDos = []
        }
    }
    
    func add(title: String) async {
        let new = ToDo(title: title)
        do {
            try await service.addToDo(new)
            toDos.append(new)
        } catch {
            print("Add failed:", error)
        }
    }
    
    func toggleIsDone(_ toDo: ToDo) async {
        var modified = toDo
        modified.isDone.toggle()
        do {
            try await service.updateToDo(modified)
            if let i = toDos.firstIndex(of: toDo) { toDos[i] = modified }
        } catch {
            print("Update failed:", error)
        }
    }
    
    func delete(_ id: UUID) async {
        do {
            try await service.deleteToDo(id)
            toDos.removeAll { $0.id == id }
        } catch {
            print("Delete failed:", error)
        }
    }
}



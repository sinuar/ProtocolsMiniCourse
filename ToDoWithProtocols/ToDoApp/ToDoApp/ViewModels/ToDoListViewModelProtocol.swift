//
//  ToDoListViewModelProtocol.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 25/11/25.
//

import Foundation

@MainActor
protocol ToDoListViewModelProtocol: ObservableObject {
    var toDos: [ToDo] { get }
    var isLoading: Bool { get }
    
    func load() async
    func add(title: String) async
    func toggleIsDone(_ toDo: ToDo) async
    func delete(_ id: UUID) async
}

//
//  Protocols.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 25/11/25.
//

import Foundation

protocol ToDoServiceProtocol {
    func fetchToDos() async throws -> [ToDo]
    func addToDo(_ toDo: ToDo) async throws
    func updateToDo(_ toDo: ToDo) async throws
    func deleteToDo(_ id: UUID) async throws
}


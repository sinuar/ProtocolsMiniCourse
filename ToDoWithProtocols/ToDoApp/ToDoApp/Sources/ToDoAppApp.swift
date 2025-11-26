//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 25/11/25.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            let service = RealToDoService()
            TodoListView(viewModel: ToDoListViewModel(service: service))
        }
    }
}

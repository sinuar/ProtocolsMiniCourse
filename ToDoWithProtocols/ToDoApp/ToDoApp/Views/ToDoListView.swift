//
//  ToDoListView.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 25/11/25.
//

import SwiftUI

struct TodoListView<VM: ToDoListViewModelProtocol>: View {
    @StateObject var viewModel: VM
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }
                
                AddToDoView { title in
                    Task { await viewModel.add(title: title) }
                }
                
                List {
                    ForEach(viewModel.toDos) { toDo in
                        ToDoRowView(toDo: toDo) {
                            Task { await viewModel.toggleIsDone(toDo) }
                        }
                    }
                    .onDelete { indexSet in
                        Task {
                            for indexSet in indexSet {
                                let id = viewModel.toDos[indexSet].id
                                await viewModel.delete(id)
                            }
                        }
                    }
                }
            }
            .navigationTitle("ToDos")
            .task { await viewModel.load() }
        }
    }
}

#Preview {
    let mock = MockToDoService(toDos: [
        ToDo(title: "Preview A"),
        ToDo(title: "Preview B", isDone: true)
    ])
    TodoListView(viewModel: ToDoListViewModel(service: mock))
}


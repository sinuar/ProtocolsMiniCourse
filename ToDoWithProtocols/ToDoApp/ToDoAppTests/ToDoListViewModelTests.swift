//
//  ToDoListViewModelTests.swift
//  ToDoApp
//
//  Created by Sinuhe Alvarez Ruedas on 27/11/25.
//

import XCTest
@testable import ToDoApp

@MainActor
final class ToDoListViewModelTests: XCTestCase {
    
    func test_load_fetches_toDos_from_service() async {
        // Arrange
        let mock = MockToDoService_Recording()
        let vm = ToDoListViewModel(service: mock)
        
        // Act
        await vm.load()
        
        // Assert
        XCTAssertTrue(mock.didCallFetch)
        XCTAssertEqual(vm.toDos.count, 2)
        XCTAssertEqual(vm.toDos.first?.title, "Mock 1")
    }
    
    func test_add_creates_new_toDo() async {
        // Arrange
        let mock = MockToDoService_Recording(toDos: [])
        let vm = ToDoListViewModel(service: mock)
        
        // Act
        await vm.add(title: "Buy milk")
        
        // Assert: service was called
        XCTAssertEqual(mock.addedItems.count, 1)
        XCTAssertEqual(mock.addedItems.first?.title, "Buy milk")
        
        // Assert: viewmodel updated UI state
        XCTAssertEqual(vm.toDos.count, 1)
        XCTAssertEqual(vm.toDos[0].title, "Buy milk")
    }
    
    func test_delete_removes_item() async {
        // Arrange
        let item = ToDo(title: "Test")
        let mock = MockToDoService_Recording(toDos: [item])
        let vm = ToDoListViewModel(service: mock)
        
        await vm.load()
        
        // Act
        await vm.delete(item.id)
        
        // Assert
        XCTAssertEqual(mock.deletedIds.first, item.id)
        XCTAssertTrue(vm.toDos.isEmpty)
    }
}




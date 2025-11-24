//
//  Protocols.swift
//  ProtocolCompositionExercise
//
//  Created by Sinuar on 21/11/25.
//

import Foundation

protocol LoggingService {
    func log(_ message: String)
}

protocol StorageService {
    func save(_ value: String)
}

// Servicio real que implementa ambos.
struct AppDataService: LoggingService, StorageService {
    func log(_ message: String) {
        print("Log: \(message)")
    }
    
    func save(_ value: String) {
        print("Saved: \(value)")
    }
}

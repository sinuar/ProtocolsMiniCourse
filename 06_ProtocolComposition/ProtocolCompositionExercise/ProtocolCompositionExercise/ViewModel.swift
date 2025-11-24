//
//  ViewModel.swift
//  ProtocolCompositionExercise
//
//  Created by Sinuar on 21/11/25.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    private let service: LoggingService & StorageService
    @Published var statusMessage: String?
    
    init(service: LoggingService & StorageService) {
        self.service = service
    }
    
    func updateProfile() {
        service.log("Updating profile...")
        service.save("Profile updated")
        print("Saved!")
    }
}

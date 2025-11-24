//  View.swift
//  ProtocolCompositionExercise
//
//  Created by Sinuar on 21/11/25.

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("ProfileView")
            
            Button("Update Profile") {
                viewModel.updateProfile()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        
        if let status = viewModel.statusMessage {
            Text(status)
        }
    }
}

// Mock combinado.
struct MockDataService: LoggingService, StorageService {
    func log(_ message: String) {
        print("Mock log:", message)
    }
    
    func save(_ value: String) {
        print("Mock save:", value)
    }
}

// Preview
#Preview {
    ProfileView(
        viewModel: ProfileViewModel(service: MockDataService())
    )
}

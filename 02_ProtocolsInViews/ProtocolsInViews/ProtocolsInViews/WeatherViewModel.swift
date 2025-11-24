//
//  WeatherViewModel.swift
//  ProtocolsInViews
//
//  Created by Sinuhe Alvarez Ruedas on 19/11/25.
//

import Foundation

@MainActor
final class WeatherViewModel: ObservableObject {
    @Published var temp: Int?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service: WeatherService

    init(service: WeatherService) {
        self.service = service
    }

    func load() async {
        isLoading = true
        errorMessage = nil
        
        do {
            temp = try await service.fetchTemperature()
        } catch {
            errorMessage = "Failed to load temperature: \(error.localizedDescription)"
            temp = nil
        }
        
        isLoading = false
    }
}

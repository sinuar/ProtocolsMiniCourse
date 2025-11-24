//
//  WeatherModel.swift
//  ProtocolsInViews
//
//  Created by Sinuhe Alvarez Ruedas on 19/11/25.
//
// WeatherModels.swift (Protocol and Service Implementation)

import Foundation

// MARK: - Protocol
protocol WeatherService {
    func fetchTemperature() async throws -> Int
}

// MARK: - Real Implementation
final class RealWeatherService: WeatherService {
    func fetchTemperature() async throws -> Int {
        // Simulate API call delay
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
        return 28 // Simulated temperature
    }
}

// MARK: - Mock Implementation (for testing/previews)
final class MockWeatherService: WeatherService {
    let mockTemperature: Int
    
    init(mockTemperature: Int = 25) {
        self.mockTemperature = mockTemperature
    }
    
    func fetchTemperature() async throws -> Int {
        return mockTemperature
    }
}

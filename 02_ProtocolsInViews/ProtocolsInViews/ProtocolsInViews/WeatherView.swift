//
//  WeatherView.swift
//  ProtocolsInViews
//
//  Created by Sinuhe Alvarez Ruedas on 19/11/25.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel: WeatherViewModel

    var body: some View {
        VStack(spacing: 20) {
            if viewModel.isLoading {
                ProgressView()
                Text("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else if let temp = viewModel.temp {
                Text("Temperature: \(temp)°")
                    .font(.title)
            } else {
                Text("No data available")
            }
        }
        .padding()
        .task {
            await viewModel.load()
        }
    }
}

// MARK: - Preview
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(
            viewModel: WeatherViewModel(
                service: MockWeatherService(mockTemperature: 22)
            )
        )
    }
}

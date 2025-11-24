//
//  ProtocolsInViewsApp.swift
//  ProtocolsInViews
//
//  Created by Sinuhe Alvarez Ruedas on 19/11/25.
//

import SwiftUI

@main
struct ProtocolsInViewsApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherView(
                viewModel: WeatherViewModel(
                    service: RealWeatherService()
                )
            )
        }
    }
}

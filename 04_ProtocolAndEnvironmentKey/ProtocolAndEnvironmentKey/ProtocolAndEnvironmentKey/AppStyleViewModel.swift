//
//  AppStyleViewModel.swift
//  ProtocolAndEnvironmentKey
//
//  Created by Sinuhe Alvarez Ruedas on 20/11/25.
//

import Foundation
import SwiftUI

private struct AppStyleKey: EnvironmentKey {
    static var defaultValue: AppStyle = DefaultAppStyle()
}

extension EnvironmentValues {
    var appStyle: AppStyle {
        get {
            self[AppStyleKey.self]
        } set {
            self[AppStyleKey.self] = newValue
        }
    }
}

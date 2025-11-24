//
//  AppStyleModel.swift
//  ProtocolAndEnvironmentKey
//
//  Created by Sinuhe Alvarez Ruedas on 20/11/25.
//

import SwiftUI

// MARK: - Protocol
protocol AppStyle {
    var font: Font { get }
    var cornerRadius: CGFloat { get }
}

// MARK: - Real Implementation
struct DefaultAppStyle: AppStyle {
    let font: Font = .title2
    let cornerRadius: CGFloat = 16
}

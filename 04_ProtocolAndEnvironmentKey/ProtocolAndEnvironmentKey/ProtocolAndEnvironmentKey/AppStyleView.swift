//
//  AppStyleView.swift
//  ProtocolAndEnvironmentKey
//
//  Created by Sinuhe Alvarez Ruedas on 20/11/25.
//

import SwiftUI

struct AppStyleView: View {
    @Environment(\.appStyle) private var appStyle
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Testing the new style!")
                .font(appStyle.font)
            
            Button("Click me") {
                print("Button tapped")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(appStyle.cornerRadius)
            // .clipShape(.rect(cornerRadius: appStyle.cornerRadius)) version moderna
        }
        .padding()
    }
}

#Preview {
    AppStyleView()
}

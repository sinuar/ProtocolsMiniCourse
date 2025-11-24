//
//  ContentView.swift
//  ProtocolAndViewExcersise
//
//  Created by Sinuhe Alvarez Ruedas on 19/11/25.
//

import SwiftUI

struct QuoteView: View {
    @StateObject private var viewModel = QuoteViewModel(service: QuoteService())
    
    var body: some View {
        VStack {
            Text(viewModel.quote)
                .padding(.top)
            
            Button("New Quote") {
                viewModel.loadQuote()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    QuoteView()
}

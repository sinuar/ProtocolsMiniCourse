//
//  QuoteView.swift
//  ProtocolForMocks
//
//  Created by Sinuhe Alvarez Ruedas on 19/11/25.
//

import SwiftUI

struct QuoteView: View {
    @StateObject private var viewModel: QuoteViewModel
    
    // Parameter type to the protocol
    init(service: QuoteServiceProtocol = QuoteService()) {
        _viewModel = StateObject(wrappedValue: QuoteViewModel(service: service))
    }
    
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
    QuoteView(service: MockQuoteService())
}

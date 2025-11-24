//
//  QuoteViewModel.swift
//  ProtocolForMocks
//
//  Created by Sinuhe Alvarez Ruedas on 19/11/25.
//

import Foundation

@MainActor
final class QuoteViewModel: ObservableObject {
    @Published var quote: String = "See your phrase!"
    
    private let service: QuoteServiceProtocol
    
    init(service: QuoteServiceProtocol) {
        self.service = service
    }
    
    func loadQuote() {
        quote = service.getQuote()
    }
}

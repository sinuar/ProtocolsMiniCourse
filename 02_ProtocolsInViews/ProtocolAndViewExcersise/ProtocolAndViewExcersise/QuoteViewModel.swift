//
//  QuoteViewModel.swift
//  ProtocolAndViewExcersise
//
//  Created by Sinuhe Alvarez Ruedas on 19/11/25.
//

import Foundation

@MainActor
final class QuoteViewModel: ObservableObject {
    @Published var quote: String = "See your phrase!"
    
    private let service: QuoteService
    
    init(service: QuoteService) {
        self.service = service
    }
    
    func loadQuote() {
        quote = service.getQuote()
    }
}

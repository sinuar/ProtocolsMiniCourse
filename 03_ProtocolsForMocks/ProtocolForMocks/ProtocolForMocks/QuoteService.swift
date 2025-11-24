//
//  QuoteService.swift
//  ProtocolForMocks
//
//  Created by Sinuhe Alvarez Ruedas on 19/11/25.
//

import Foundation

// MARK: - Protocol
protocol QuoteServiceProtocol {
    func getQuote() -> String
}

// MARK: - Real Implementation
final class QuoteService: QuoteServiceProtocol {
    func getQuote() -> String {
        return "Believe you can and you're halfway there."
    }
}

// MARK: - Mock implementation
struct MockQuoteService: QuoteServiceProtocol {
    func getQuote() -> String {
        return "This is a Mock Quote for previews"
    }
}

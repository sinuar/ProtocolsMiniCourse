// PROTOCOLS.
// SwiftUI elimina UIKit boilerplate, pero no elimina la necesidad de
// arquitectura. Los protocolos te ayudan a:
// Separar UI de lógica.
// Permitir mocks para pruebas.
// Hacer vistas más reutilizables.
// Cumplir con SOLID (especialmente "Interface segregation" y "Dependency inversion").

import SwiftUI

// Ejemplo Basico.

protocol GreetingProvider {
    func greeting(for name: String) -> String
}

struct EnglishGreetingProvider: GreetingProvider {
    func greeting(for name: String) -> String {
        "Hello, \(name)!"
    }
}

// Mini ejercicio.

protocol MessageFormatter {
    func formatMessage(_ text: String) -> String
}

struct EmojiMessageFormatter: MessageFormatter {
    func formatMessage(_ text: String) -> String {
        return "💬 \(text)"
    }
}

struct ChatMessageFormatter: MessageFormatter {
    func formatMessage(_ text: String) -> String {
        return "Your response: \(text)"
    }
}

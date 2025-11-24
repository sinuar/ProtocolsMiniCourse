import Foundation
import SwiftUI

// MARK: - Ejemplo 1. Protocolos separados

protocol Trackable {
    func track(event: String)
}

protocol Purchasable {
    func purchase(item: String) async throws
}

// Servicio que implementa ambos.
struct AnalyticsPurchaseService: Trackable, Purchasable {
    func track(event: String) {
        print("Track:", event)
    }

    func purchase(item: String) async throws {
        print("Purchasing:", item)
    }
}

// Función que requiere ambos protocolos a la vez.
func performPurchase(using service: Trackable & Purchasable) async {
    service.track(event: "start_purchase")
    try? await service.purchase(item: "Necklace")
    service.track(event: "end_purchase")
}

// MARK: - Ejemplo 2. Uso dentro de un ViewModel de SwiftUI.
// Por ejemplo, un ViewModel que necesita:
// Guarda datos (StorageService)
// Genera logs (LoggingService)

protocol LoggingService {
    func log(_ message: String)
}

protocol StorageService {
    func save(_ value: String)
}

// Servicio real que implementa ambos.
struct AppDataService: LoggingService, StorageService {
    func log(_ message: String) {
        print("LOG:", message)
    }

    func save(_ value: String) {
        print("Saved:", value)
    }
}

// ViewModel con composición
@MainActor
final class ProfileViewModel: ObservableObject {
    private let service: LoggingService & StorageService
    
    init(service: LoggingService & StorageService) {
        self.service = service
    }
    
    func updateProfile() {
        service.log("Updating profile")
        service.save("Profile data")
    }
}

// View.
struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        Button("Update profile") {
            viewModel.updateProfile()
        }
    }
}

// MARK: - Usar esta composición con Mocks (iOS testing + Previews).

// Mock combinado.
struct MockDataService: LoggingService, StorageService {
    func log(_ message: String) { }
    func save(_ value: String) { }
}

// Preview
#Preview {
    ProfileView(
        viewModel: ProfileViewModel(service: MockDataService())
    )
}
/*
Cuándo usar Protocol Composition (Guía Pro)
☑️ Úsalo cuando:
- La vista o ViewModel solo necesitan un subconjunto claro de capacidades.
- El servicio real implementa varios protocolos.
- Quieres evitar dependencias gigantes (Clean Architecture).
- Necesitas diferentes implementaciones para Previews, Tests o producción.

❌ No lo uses cuando:
- Tienes un solo protocolo que ya cubre la necesidad.
- No tienes una razón clara para combinar servicios.
- Necesitas persistencia dinámica en runtime (usa type erasure).
*/


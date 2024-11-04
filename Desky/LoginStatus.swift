import SwiftUI
import Combine

class LoginStatus: ObservableObject {
    @Published var isLoggedIn: Bool = false {
        didSet {
            print("Login status changed to: \(isLoggedIn)") // Debug: Track changes to login status
        }
    }
}

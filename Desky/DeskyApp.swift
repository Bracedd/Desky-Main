import SwiftUI

@main
struct DeskyApp: App {
    @StateObject private var loginStatus = LoginStatus() // Create the login status object

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginStatus) // Provide the login status object to the environment
        }
    }
}

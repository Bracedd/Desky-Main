import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginStatus: LoginStatus // Access login status from environment
    
    var body: some View {
        Group {
            if loginStatus.isLoggedIn {
                HomeView()
            } else {
                VStack {
                    Button("Login with Spotify") {
                        authenticateWithSpotify()
                    }
                    .padding()
                }
            }
        }
    }
    
    func authenticateWithSpotify() {
        let encodedScope = Constants.scope.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let authURLString = "https://accounts.spotify.com/authorize?client_id=\(Constants.spotifyClientID)&response_type=code&redirect_uri=\(Constants.redirectURI)&scope=\(encodedScope)"
        
        guard let url = URL(string: authURLString) else {
            print("Failed to create URL.")
            return
        }
        
        // Use open method with completion handler
        UIApplication.shared.open(url, options: [:]) { success in
            if success {
                print("Successfully opened URL: \(url)")
            } else {
                print("Failed to open URL: \(url)")
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environmentObject(LoginStatus()) // Provide a mock environment object for previews
        }
    }
}

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to Desky!")
                .font(.largeTitle)
                .padding()
            Text("You are now logged in.")
                .font(.headline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

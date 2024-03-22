import SwiftUI

struct ContentView: View {
    var body: some View {
        let viewModel = LoginViewModel()
        return LoginView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

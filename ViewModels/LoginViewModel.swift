import Foundation

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    
    func login() {
        // Perform login logic here
        // For demonstration purposes, just printing the username and password
        print("Username: \(username), Password: \(password)")
    }
}

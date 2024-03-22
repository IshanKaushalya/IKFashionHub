import Foundation

class RegisterViewModel: ObservableObject{
    @Published var username = ""
    @Published var phonenumber = ""
    @Published var homeaddress = ""
    @Published var email = ""
    @Published var password = ""
}

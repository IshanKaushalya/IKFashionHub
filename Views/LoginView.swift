import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var isRegistering = false
    
    var body: some View {
        VStack {
            Image("your_image_name") // Replace "your_image_name" with the name of your image asset
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200) // Adjust the size as needed
            
            TextField("Username", text: $viewModel.username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            Button(action: {
                viewModel.login()
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(5.0)
            }
            Text("If you don't have an account, click here to register for IKFashionHub")
                .foregroundColor(.red)
                .padding()
                .frame(maxWidth: .infinity)
                
            
            Button(action: {
                isRegistering = true
            }) {
                Text("Register")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(5.0)
            }
        }
        .padding()
        .sheet(isPresented: $isRegistering) {
            RegisterView()
        }
    }
}

//
//  UserViewModel.swift
//  IKFashionHub
//
//  Created by Sajana Rupasinghe on 2024-03-31.
//

import Foundation
import SwiftUI


class UserViewModel : ObservableObject{
    @Published var users: [UserDataModel] = []
    @Published var user: UserDataModel?
    
    @AppStorage("AUTH_KEY") var authenticated = false {
        willSet {objectWillChange.send()}
    }
    @AppStorage("USER_KEY") var username = ""
    
    @Published var password : String = ""
    @Published var showError : Bool = false
    @Published var errorMessage : String = ""
    @Published var success : Bool = false
    @Published var email : String = ""
    
    func logout() {
        self.password = ""
        self.email = ""
        self.user = nil
        self.username = ""
        authenticated = false
    }
    
    func login(email: String, password: String) {
        if email.isEmpty || password.isEmpty{
            showError=true
            errorMessage="Username or Password Cannot be empty"
        } else {
            guard let url = URL(string: "http://localhost:3030/api/users/login") else {
                self.errorMessage = "Invalid URL"
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let credentials = ["email": email, "password": password]
            do {
                let jsonData = try JSONEncoder().encode(credentials)
                request.httpBody = jsonData
            } catch {
                self.showError = true
                self.errorMessage = "Error encoding credentials"
                return
            }
            
            URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    
                    if let error = error {
                        self.showError = true
                        self.errorMessage = "Login failed: \(error.localizedDescription)"
                        return
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse else {
                        self.showError = true
                        self.errorMessage = "Invalid response"
                        return
                    }
                    
                    if httpResponse.statusCode == 200 {
                        self.showError = false
                        self.success = true
                        self.authenticated = true
                        self.fetchUser(email: email)
                        self.username = email
                    }
                    else {
                        self.showError = true
                        self.errorMessage = "Login failed: Check username and password"
                    }
                }
            }.resume()
            
        }
    }
    
    func fetchUser(email: String) {
        guard let url = URL(string: "http://localhost:3000/api/users/\(email)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let userData = try JSONDecoder().decode(UserDataModel.self, from: data)
                        self.user = userData
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }
        }.resume()
    }
}

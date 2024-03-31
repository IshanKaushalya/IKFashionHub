//
//  UserViewModel.swift
//  IKFashionHub
//
//  Created by Sajana Rupasinghe on 2024-03-31.
//

import Foundation

struct UserDataModel: Codable {
    var userID: Int
    var fullName: String
    var telno: Int
    var email: String
    var address: String
    var password: String
}

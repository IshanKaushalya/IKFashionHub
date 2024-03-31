//
//  OrderDataModel.swift
//  IKFashionHub
//
//  Created by Sajana Rupasinghe on 2024-03-31.
//

import Foundation

struct OrderDataModel: Codable {
    //var id: Int
    
    var date: String
    var total: Double
    var email: String
}

struct OrderDataRetrieveModel: Codable{
    var id: Int
    var date: String
    var total: Double
    var email: String
}

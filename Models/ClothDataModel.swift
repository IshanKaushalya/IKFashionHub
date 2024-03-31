//
//  ClothDataModel.swift
//  IKFashionHub
//
//  Created by Ishan Kaushalya on 2024-03-28.
//

import Foundation

struct ClothDataModel: Codable, Identifiable {
    
    var id: Int
    var productName: String
    var image: String
    var productDescription: String
    var price: Double
    var category: String
    var subCategory: String
    
}

//var sampleClothData = [ClothDataModel(imageName: "sampleMen", price: 990.10, itemName: "test1"),
//                       ClothDataModel(imageName: "sampleMen", price: 1200.00, itemName: "test2"),
//                       ClothDataModel(imageName: "sampleMen", price: 990.00, itemName: "test3"),
//                       ClothDataModel(imageName: "sampleMen", price: 110.00, itemName: "test4"),
//                       ClothDataModel(imageName: "sampleMen", price: 200.00, itemName: "test5"),
//                       ClothDataModel(imageName: "sampleMen", price: 110.10, itemName: "test6")
//                                     
//]

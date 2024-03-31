//
//  ProductViewModel.swift
//  IKFashionHub
//
//  Created by Ishan Kaushalya on 2024-03-28.
//


import Foundation
import SwiftUI

class ClothViewModel: ObservableObject {
    
    @Published var clothingDM = [ClothDataModel]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "http://localhost:3030/api/Products") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
    
    func fetchData(forCategory category: String) {
        let dataURL = "http://localhost:3030/api/Products/\(category)"
        
        guard let url = URL(string: dataURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
    
    
    func fetchData(forSubcategory subCategory: String) {
        let dataURL = "http://localhost:3030/api/Products/subCategory/\(subCategory)"
        
        guard let url = URL(string: dataURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
    
    
    func fetchData(forSubcategory subcategory: String, inCategory category: String) {
        let formattedCategory = category.capitalized
        let formattedSubcategory = subcategory.lowercased()
        
        let dataURL = "http://localhost:3030/api/Products/\(formattedCategory)/\(formattedSubcategory)"
        
        guard let url = URL(string: dataURL) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil,
               let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            } else {
                print("Fetch error: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
    func fetchData(forQuery query: String) {
        guard let url = URL(string: "http://localhost:3030/api/search?query=\(query)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
    func fetchData(forQueries query: String) {
        // Your existing implementation for fetching data based on query
    }
    
    // New method for fetching sorted products
    func fetchSortedData(order: String) {
        guard let url = URL(string: "http://localhost:3030/api/sortByPrice?order=\(order)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
    
//    func fetchData(id: Int) {
//        guard let url = URL(string: "http://localhost:3030/api/Products/\(id)") else {
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Error: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//            
//            if let decodedResponse = try? JSONDecoder().decode[ClothDataModel].self, from: data) {
//                DispatchQueue.main.async {
//                    self.clothingDM = decodedResponse
//                }
//            }
//            
//        }.resume()
//    }
    
    func fetchData(id: Int) {
        guard let url = URL(string: "http://localhost:3030/api/Productss/\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
}




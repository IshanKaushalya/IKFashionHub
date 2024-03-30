//
//  CartViewModel.swift
//  IKFashionHub
//
//  Created by Ishan Kaushalya on 2024-03-28.
//

import Foundation

class CartVeiwModel: ObservableObject {
    
    @Published private(set) var products: [ClothDataModel] = []
    @Published private(set) var total: Double = 0
    
    func addToCart(product: ClothDataModel) {
        products.append(product)
        total += product.price
    }
        func removeFromCart(product: ClothDataModel) {
            products = products.filter { $0.id != product.id }
            total -= product.price
        }
        
    }

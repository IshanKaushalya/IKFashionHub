//
//  CartViewModel.swift
//  IKFashionHub
//
//  Created by Ishan Kaushalya on 2024-03-28.
//

import Foundation
import SwiftUI

class CartViewModel : ObservableObject{
    @Published private(set) var items : [ClothDataModel] = []
    @Published private(set) var total : Double = 0.00
    
    func addtoCart(item : ClothDataModel){
        items.append(item)
        total += item.price
    }
    
    func removeItemFromCart(item : ClothDataModel){
        items = items.filter {$0.clothID != item.clothID}
        total -= item.price
    }
}

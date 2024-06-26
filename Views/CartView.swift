//
//  CartView.swift
//  IKFashionHub
//
//  Created by Ishan Kaushalya on 2024-03-28.
//

import SwiftUI

struct CartVeiw: View {
    
    @EnvironmentObject var cartVM : CartVeiwModel
    
    var body: some View {
        List{
            if cartVM.products.count > 0 {
                ForEach(cartVM.products, id: \.id) {
                    product in
                    ProductRow(product: product)
  
                }
                
            }else{
                Text("Your cart is empty!!!")
            }
            
            
        }.navigationTitle(Text("My Cart"))
            .padding(.top)
        
        HStack{
            Text("your cart total is")
            Spacer()
            Text("$ \(cartVM.total, specifier: "%.2f")").bold()
        }
        .padding()
        
        
        
        Button(action:{
            //loginVM.verifyLogin()
        },label: {
            RoundedRectangle(cornerRadius: 10).frame(height:50)
                .padding(.horizontal,47)
                .padding(.top)
                .foregroundColor(.black)
                }).overlay{
                    Text("Checkout").bold()
                        .foregroundStyle(.white)
                        .padding(.top)
                }
        
    }
    
}

#Preview {
    CartVeiw()
        .environmentObject(CartVeiwModel())
}

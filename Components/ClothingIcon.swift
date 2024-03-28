//
//  ClothingIcon.swift
//  IKFashionHub
//
//  Created by Ishan Kaushalya on 2024-03-28.
//

import SwiftUI

struct ClothingIcon: View {
    @State private var refresh = false
    var itemDM : ClothDataModel
    var body: some View {
        ZStack(alignment:.topTrailing){
            ZStack(alignment:.bottom){
                Image(itemDM.imageName)
                    .resizable()
                    .cornerRadius(5)
                    .frame(width: 150, height: 180)
                    .scaledToFit()
                HStack(){
                    VStack(alignment:.leading ){
                        Text(itemDM.itemName)
                            .bold()
                        Text("\(itemDM.price, specifier: "%.2f")LKR")
                            .font(.caption)
                        
                    }
                    
                    
                }
                .padding()
                .frame(width: 150, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                    
                }
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                
                
            }
            
        }
    }


#Preview {
    ClothingIcon(itemDM: sampleClothData[0])
}

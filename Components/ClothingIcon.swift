//
//  ClothingIcon.swift
//  IKFashionHub
//
//  Created by Ishan Kaushalya on 2024-03-28.
//

import SwiftUI

struct ClothingIcon: View {
    //@State private var refresh = false
    var clothingDM : ClothDataModel 
    var body: some View {
        NavigationLink(destination: ProductDetailView( clothingDM: clothingDM)){
            ZStack(alignment:.topTrailing){
                ZStack(alignment:.bottom){
                    let imageURL = URL(string: clothingDM.image)!
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView() // Placeholder while loading
                                .cornerRadius(20)
                                .frame(width: 180, height: 250)
                        case .success(let image):
                            image
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: 180, height: 250)
                        case .failure(let error):
                            Text("Failed to load image")
                                .foregroundColor(.red)
                                .padding()
                                .frame(width: 180, height: 250)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.red, lineWidth: 1)
                                )
                                .onTapGesture {
                                    print("Error loading image: \(error.localizedDescription)")
                                }
                        default:
                            EmptyView()
                        }
                    }
                    HStack(){
                        VStack(alignment:.leading ){
                            Text(clothingDM.productName)
                                .bold()
                            Text("\(clothingDM.price, specifier: "%.2f")LKR")
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
    }
    


//#Preview {
//    ClothingIcon(itemDM: sampleClothData[0])
//}

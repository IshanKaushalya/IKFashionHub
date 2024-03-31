//
//  ProductDetailView.swift
//  IKFashionHub
//
//  Created by Sajana Rupasinghe on 2024-03-31.
//

import SwiftUI

struct ProductDetailView: View {
    //@ObservedObject var viewModel: ClothViewModel
    //@State var productId: Int
    
    //    init(productId: Int) {
    //        self.productId = productId
    //        self.viewModel = ClothViewModel()
    //        self.viewModel.fetchData(id: productId)
    //    }
    @State private var selectedSize: String? = nil
    @State private var quantity: Int = 1 
    
    var clothingDM : ClothDataModel
    
    var body: some View {
        NavigationView{
            VStack {
                //if let product = viewModel.clothingDM.first {
                // Product Image
                if let imageURL = URL(string: clothingDM.image),
                   let imageData = try? Data(contentsOf: imageURL),
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                } else {
                    // Placeholder image or error handling
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray)
                }
                
                Text(clothingDM.productName)
                    .font(.title)
                HStack{
                    Text("Description: \(clothingDM.productDescription)")
                        .font(.body)
                }
                .background(Color.gray)
                .padding(15)
                
                Text("\(clothingDM.price, specifier: "%.2f")LKR")
                    .font(.headline)
                // Add additional views for displaying other product details
                //} else {
                //ProgressView()
                //}
                HStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 3) {
                        ForEach(["Small", "Medium", "Large", "XL"], id: \.self) { size in
                            Button(action: {
                                selectedSize = size
                            }) {
                                Text(size)
                                    .font(.body)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                    .background(selectedSize == size ? Color.blue : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                            HStack{  Stepper(value: $quantity, in: 1...10) {
                                Text("Quantity: \(quantity)")
                            }
                            .padding(.horizontal)
                                
                                // Add to Cart Button
                                Button(action: {
                                    // Add to cart functionality
                                }, label: {
                                    Text("Add to Cart")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                        
                                })
                                .frame()
                                //.padding(.top)
                                .padding(.bottom)
                            }
                            
                        }
                    }
                }
            }
        .padding()
        .navigationTitle("Product Detail").bold()
        }
    }


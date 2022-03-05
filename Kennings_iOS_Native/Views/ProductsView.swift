//
//  ProductView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 05/03/2022.
//

import SwiftUI

struct ProductsView: View {
    @StateObject private var ProductsVM: ProductsViewModel
    init(name: String){
        _ProductsVM = StateObject(wrappedValue: ProductsViewModel(Name: name))
    }
    
    var body: some View {
        ZStack{
            Color.init(UIColor(hexString: "F2F2F2"))
                .edgesIgnoringSafeArea(.all)
            
            if ProductsVM.loading {
                ProgressView()
            }
            else {
                ScrollView{
                    VStack{
                        ForEach(ProductsVM.products, id:\.id) {product in
                            NavigationLink(destination: ProductView(name: product.name)){
                                ProductsViewItem(name: product.name, price: product.cost!)
                            }.isDetailLink(false)
                        }
                    }
                    
                }
            }
        }.navigationTitle(ProductsVM.parent)
    }
}

struct ProductsViewItem: View {
    
    var name: String
    var price: Double
    var body: some View {
        
        Group{
            HStack{
                VStack{
                    Text(name)
                }
                Text("£" + String(price))
            }
        }
            .foregroundColor(.black)
            .frame(width: 350, height: 200)
            .padding(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray)
            )
    }
}

struct ProductsViewItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductsViewItem(name: "45 x 45mm (2 x 2) C16 Graded PAR Eased Edge Treated Timber", price: 39.99)
    }
}

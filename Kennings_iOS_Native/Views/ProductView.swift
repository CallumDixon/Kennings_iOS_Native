//
//  ProductView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 05/03/2022.
//

import SwiftUI

struct ProductView: View {
    @StateObject private var ProductVM: ProductViewModel
    @EnvironmentObject var Basket: BasketViewModel

    init(name: String){
        _ProductVM = StateObject(wrappedValue: ProductViewModel(Name: name))
    }
    var body: some View {
        ZStack{
            Color.init(UIColor(hexString: "F2F2F2"))
                .edgesIgnoringSafeArea(.all)
            
            if ProductVM.loading {
                ProgressView()
            }
            else {
                ScrollView{
                    Group{
                        Text(ProductVM.name)
                        Text(ProductVM.product!.description)
                        Text(String((ProductVM.product?.cost)!))
                        Button(action: {
                            Basket.addBasketItem(name: ProductVM.product!.name)
                        }){
                            Text("Add to Basket")
                        }
                    }
                }
            }
        }.navigationTitle(ProductVM.name)
    }
}


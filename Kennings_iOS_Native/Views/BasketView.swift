//
//  BasketView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 02/02/2022.
//

import SwiftUI

struct BasketView: View {
    
    // Environment object so it can be shared
    @EnvironmentObject var basket: BasketViewModel
    
    var body: some View {
        ScrollView{
            VStack {
                Color.init(UIColor(hexString: "F2F2F2"))
                .edgesIgnoringSafeArea(.all)
                ForEach(basket.currentBasket, id: \.self){ item in
                    Text(item)
                }
            }
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}

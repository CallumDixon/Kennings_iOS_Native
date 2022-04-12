//
//  HomeView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 02/02/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var basket: BasketViewModel
    
    func removeAll() {
        UserDefaults.standard.removeObject(forKey: "items")
        basket.removeBasketAll()
    }
    
    var body: some View {
        ZStack {
            Color.init(UIColor(hexString: "#96C72B")).edgesIgnoringSafeArea(.all)
            
            
            Color.init(UIColor(hexString: "F2F2F2")).overlay(
                VStack{
                    Text("Home View")
                    // For testing the basket storage integration
                    Button("Remove item", action: { removeAll() })
                }
            )
                
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

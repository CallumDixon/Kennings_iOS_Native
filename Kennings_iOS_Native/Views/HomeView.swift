//
//  HomeView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 02/02/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.init(UIColor(hexString: "F2F2F2")).edgesIgnoringSafeArea(.all)
    
            VStack{
                Text("Home View")
                Button("Remove item", action: { UserDefaults.standard.removeObject(forKey: "items")})
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

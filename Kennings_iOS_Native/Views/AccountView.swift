//
//  AccountView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 02/02/2022.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack {
            Color.init(UIColor(hexString: "#96C72B")).edgesIgnoringSafeArea(.all)
            
            
            Color.init(UIColor(hexString: "F2F2F2")).overlay(
                VStack{
                    Text("Account View")

                }
            )
                
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

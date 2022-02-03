//
//  BasketView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 02/02/2022.
//

import SwiftUI

struct BasketView: View {
    var body: some View {
        ZStack {
            Color.init(UIColor(hexString: "F2F2F2"))
            .edgesIgnoringSafeArea(.all)
          Text("Basket View")
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}

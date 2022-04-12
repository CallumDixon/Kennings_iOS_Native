//
//  ContentView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 01/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @StateObject var basket = BasketViewModel()
    
    var body: some View {
        ZStack{
            Color.init(uiColor: UIColor(hexString: "#96C72B")).edgesIgnoringSafeArea(.all)
                            
            TabView(selection: $selection){
                    HomeView()
                        .tabItem{
                            Text("Home")
                            Image(systemName: "house.fill")
                        }
                    BrowseNavigatorView(initialTitle: "Categories")
                        .tabItem{
                            Text("Browse")
                            Image(systemName: "text.book.closed.fill")
                        }
                    AccountView()
                        .tabItem{
                            Text("Account")
                            Image(systemName: "person.fill")
                        }
                    BasketView()
                        .tabItem{
                            Text("Basket")
                            Image(systemName: "cart.fill")
                        }
                }.onAppear{UITabBar.appearance().backgroundColor = .white}
                .accentColor(.init(UIColor(hexString: "#96C72B"))).environmentObject(basket)

        }
    }
}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

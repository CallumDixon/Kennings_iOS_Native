//
//  BrowseNavigatorView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 09/02/2022.
//

import SwiftUI

struct BrowseNavigatorView: View {
    
    var initialTitle: String
    
    var body: some View {
        NavigationView {
            BrowseView(title: initialTitle)
        }.navigationViewStyle(.stack) 
    }
}

struct BrowseNavigatorView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseNavigatorView(initialTitle: "Categories")
    }
}

//
//  BrowseView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 02/02/2022.
//

import SwiftUI
import Amplify

struct BrowseView: View {
    var body: some View {
        ZStack {
            Color.init(UIColor(hexString: "F2F2F2"))
            .edgesIgnoringSafeArea(.all)
          Text("Browse View")
        }
        .onAppear{
            QueryCategories(Parent: "Categories")
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

func QueryCategories(Parent: String) {
    
    let filter = Category.keys.parent == Parent
    
    Amplify.API.query(request: .paginatedList(Category.self, where: filter ,limit: 1000)) { event in
        switch event {
        case .success(let result):
            switch result {
            case .success(let categories):
                
                let sortedCategories = categories.sorted(by: {(i1, i2) -> Bool in
                    
                    if let Ui1 = i1.order, let Ui2 = i2.order {
                        return (Ui1 < Ui2)
                    }
                    return false
                })
                
                
                for category in sortedCategories {
                    print(category.name)
                }
            case .failure(let error):
                print("Got failed result with \(error.errorDescription)")
            }
        case .failure(let error):
            print("Got failed event with error \(error)")
        }
    }
}

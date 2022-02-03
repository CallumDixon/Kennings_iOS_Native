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
            listTodos()
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

func listTodos() {
    Amplify.API.query(request: .paginatedList(Category.self, limit: 1000)) { event in
        switch event {
        case .success(let result):
            switch result {
            case .success(let categories):
                for category in categories {
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

//
//  BrowseView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 02/02/2022.
//

import SwiftUI
import Amplify

struct BrowseView: View {
    
    @ObservedObject var CategoriesVM = BrowseViewModel(Parent: "Categories")
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Color.init(UIColor(hexString: "F2F2F2"))
                .edgesIgnoringSafeArea(.all)
                
                if CategoriesVM.loading {
                    ProgressView()
                }
                else {
                    ScrollView{
                        VStack{
                            ForEach(CategoriesVM.categoryList, id:\.id) {category in
                                CategoryView(name: category.name)
                            }
                        }
                    }.padding(.top,1)
                }
            }.navigationTitle("Title")
            .onAppear{
                CategoriesVM.QueryCategories()
            }
        }
    }
}

struct CategoryView: View {
    
    var name: String
    
    var body: some View {
        
        Text(name)
            .frame(width: 300, height: 50)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray)
            )
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(name: "Timber & Sheet Materials")
            .previewLayout(.sizeThatFits)
    }
}

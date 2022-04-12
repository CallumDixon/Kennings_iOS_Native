//
//  BrowseView.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 02/02/2022.
//

import SwiftUI
import Amplify

struct BrowseView: View {
    
    @StateObject private var CategoriesVM: BrowseViewModel
    
    init(title: String){
        _CategoriesVM = StateObject(wrappedValue: BrowseViewModel(Parent: title))
    }
    
    @ViewBuilder
    var body: some View {
        
        ZStack {
            Color.init(UIColor(hexString: "#96C72B")).edgesIgnoringSafeArea(.all)

            // If the categories are still being fetched, render the progress symbol
            if CategoriesVM.loading {
                Color.init(UIColor(hexString: "F2F2F2")).overlay(

                ProgressView())
            }
            else {
                Color.init(UIColor(hexString: "F2F2F2")).overlay(

                ScrollView{
                    VStack{
                        ForEach(CategoriesVM.categoryList, id:\.id) {category in
                            Group{
                                
                                // Render category that can navigate to products
                                if category.leaf_node!{
                                    NavigationLink(destination: ProductsView(name: category.name)){
                                        CategoryView(name: category.name)
                                    }.isDetailLink(false)
                                }
                                // Render category that can navigate to other categories
                                else{
                                    NavigationLink(destination: BrowseView(title: category.name)){
                                        CategoryView(name: category.name)
                                    }.isDetailLink(false)
                                }
                            }
                        }
                    }
                }.padding(.top,1))
            }
        }.navigationTitle(CategoriesVM.parent)
    }
}

// Takes a name parameter and renders a single category view
struct CategoryView: View {
    
    var name: String
    
    var body: some View {
        
        Text(name)
            .foregroundColor(.black)
            .frame(width: 350, height: 45, alignment: .leading)
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray))
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(name: "Timber & Sheet Materials")
            .previewLayout(.sizeThatFits)
    }
}

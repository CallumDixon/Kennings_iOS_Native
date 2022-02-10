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

    
    var body: some View {
        
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
                            
                            NavigationLink(destination: BrowseView(title: category.name)){
                                CategoryView(name: category.name)
                            }
                        }
                    }
                }.padding(.top,1)
            }
        }.navigationTitle(CategoriesVM.parent)
        .onAppear{
            CategoriesVM.QueryCategories()
        }
    }
}

struct CategoryView: View {
    
    var name: String
    
    var body: some View {
        
        Text(name)
            .foregroundColor(.black)
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

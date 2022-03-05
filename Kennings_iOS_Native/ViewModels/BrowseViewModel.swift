//
//  BrowseViewModel.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 09/02/2022.
//
import Foundation
import Amplify

final class BrowseViewModel: ObservableObject
{
    @Published var categoryList:[Category] = []
    @Published var loading = true
    var parent: String
    
    init(Parent: String){
        self.parent = Parent
        QueryCategories()
    }
    
    
    func QueryCategories() {
        
        let filter = Category.keys.parent == self.parent
        
        Amplify.API.query(request: .paginatedList(Category.self, where: filter ,limit: 1000)) { event in
            
            DispatchQueue.main.async {
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
                    
                        self.categoryList = sortedCategories
                        
                        self.loading = false
                        
                    case .failure(let error):
                        print("Got failed result with \(error.errorDescription)")
                    }
                case .failure(let error):
                    print("Got failed event with error \(error)")
                }
            }
        }
    }
}

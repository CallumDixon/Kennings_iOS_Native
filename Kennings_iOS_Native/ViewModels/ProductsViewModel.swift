//
//  ProductViewModel.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 05/03/2022.
//
import Foundation
import Amplify
import CoreMedia

final class ProductsViewModel : ObservableObject
{
    @Published var products:[Product] = []
    @Published var loading = true
    var parent: String
    
    init(Name: String){
        self.parent = Name
        QueryProducts()
    }
    
    func QueryProducts() {
        
        let filter = Product.keys.parent == self.parent
        
        Amplify.API.query(request: .paginatedList(Product.self,
            where: filter, limit: 1000)) { event in
            
            DispatchQueue.main.async {
                switch event {
                    
                case .success(let result):
                    
                    switch result {
                        
                    case .success(let products):
                        self.products = products.elements
                        self.loading = false
                        
                    case .failure(let error):
                        print(error.errorDescription)
                    }
                    
                    
                case .failure(let error):
                    print(error.errorDescription)
                }
            }
        }
    }
}

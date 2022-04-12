//
//  ProductViewModel.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 05/03/2022.
//

import Foundation
import Amplify

final class ProductViewModel: ObservableObject
{
    @Published var product: Product?
    @Published var loading = true
    var name: String
    
    init(Name: String){
        self.name = Name
        QueryProducts()
    }
    
    // Fetches a single product from the API
    func QueryProducts() {
        
        let filter = Product.keys.name == self.name
        
        Amplify.API.query(request: .paginatedList(Product.self,
            where: filter, limit: 1000)) { event in
            
            DispatchQueue.main.async {
                switch event {
                    
                case .success(let result):
                    
                    switch result {
                        
                    case .success(let products):
                        // An array is returned, so select first element and set loading flag so product view can re-render
                        self.product = products.elements[0]
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

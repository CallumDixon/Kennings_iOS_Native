//
//  BasketViewModel.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 05/03/2022.
//

import Foundation
import SwiftUI

final class BasketViewModel: ObservableObject{
    
    @Published var currentBasket:[String] = []
    
    init(){
        print(UserDefaults.standard.dictionaryRepresentation())
        currentBasket = (UserDefaults.standard.array(forKey: "items") as? [String] ?? [String]())
        print(UserDefaults.standard.array(forKey: "items") as? [String] ?? [String]())
    }
    
        
    func addBasketItem(name: String){
        currentBasket.append(name)
        UserDefaults.standard.set(currentBasket, forKey: "items")
    }
    func removeBasketItem(name: String){
        UserDefaults.standard.removeObject(forKey: "items")
        currentBasket = currentBasket.filter{$0 != name}
        UserDefaults.standard.set(name, forKey: "items")

    }
    func removeBasketAll(name: String){
        UserDefaults.standard.removeObject(forKey: "items")
    }
}

//
//  BasketViewModel.swift
//  Kennings_iOS_Native
//
//  Created by Callum Dixon on 05/03/2022.
//

import Foundation
import SwiftUI

// This is observed by the contentview, therefore any view can reference it as an environment object
final class BasketViewModel: ObservableObject{
    
    @Published var currentBasket:[String] = []
    
    init(){
        // If the 'items' key exists in device storage, set that as the state, if not set state as empty array
        currentBasket = (UserDefaults.standard.array(forKey: "items") as? [String] ?? [String]())
    }
    
    // These functions keep the basket VM in sync with the devices storage.
    func addBasketItem(name: String){
        currentBasket.append(name)
        UserDefaults.standard.set(currentBasket, forKey: "items")
    }
    func removeBasketItem(name: String){
        UserDefaults.standard.removeObject(forKey: "items")
        currentBasket = currentBasket.filter{$0 != name}
        UserDefaults.standard.set(name, forKey: "items")

    }
    func removeBasketAll(){
        UserDefaults.standard.removeObject(forKey: "items")
        currentBasket.removeAll()
    }
}

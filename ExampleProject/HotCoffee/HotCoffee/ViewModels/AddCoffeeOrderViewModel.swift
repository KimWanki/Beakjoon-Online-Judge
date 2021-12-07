//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by WANKI KIM on 2021/11/30.
//

import Foundation

struct AddCoffeeOrderViewModel {
    
    var name: String?
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized
        }
    }
    
}

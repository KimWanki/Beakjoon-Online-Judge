//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by WANKI KIM on 2021/11/30.
//

import Foundation

class OrderListViewModel {
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return ordersViewModel[index]
    }
    
    
}

struct OrderViewModel {
    let order: Order
    
}

extension OrderViewModel {
    var name: String {
        return self.order.name
    }
    
    var coffeeName: String {
        return self.order.coffeeName
    }
}

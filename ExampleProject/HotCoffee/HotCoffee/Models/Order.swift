//
//  Order.swift
//  HotCoffee
//
//  Created by WANKI KIM on 2021/11/30.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espresso
    case cortado
}

enum CoffeeSize: String, Codable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let coffeeName: String
    let total: Double
    let size: String
}


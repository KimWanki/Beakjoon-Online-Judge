//
//  main.swift
//  11052_카드구매하기
//
//  Created by WANKI KIM on 2021/11/01.
//

import Foundation

let input = Int(readLine()!)!

var price = readLine()!.split(separator: " ").map { Int(String($0))! }
price.insert(0, at: 0)

for num in 2...input {
    for card in 1..<num {
        let first = card
        let second = num-first
        if price[first] + price[second] > price[num] {
            price[num] = price[first] + price[second]
        }
    }
}
print(price[input])


//
//  main.swift
//  1644_소수의연속합
//
//  Created by WANKI KIM on 2021/09/21.
//

import Foundation

let numbers = Int(readLine()!)!

var number = [Int].init(1...numbers)
print(number)

for number in 2...numbers {
    for j in 2...numbers {
        let value = j + number
    }
}

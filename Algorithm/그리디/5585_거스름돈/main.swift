//
//  main.swift
//  5585_거스름돈
//
//  Created by WANKI KIM on 2021/11/02.
//

import Foundation

let range = [500, 100, 50, 10, 5, 1]

let input = Int(readLine()!)!

var change = 1000 - input

var result = 0

for money in range {
    if change == 0 {
        break
    }
    if change >= money {
        result += change / money
        change %= money
    }
}

print(result)


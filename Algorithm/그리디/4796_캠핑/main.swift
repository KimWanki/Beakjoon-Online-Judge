//
//  main.swift
//  4796_캠핑
//
//  Created by WANKI KIM on 2021/11/06.
//

import Foundation

let endSign = "0 0 0"

var sequence: Int = 1

while true {
    let input = readLine()!
    if input == endSign { break }
    let numbers = input.split(separator: " ").map { Int($0)! }
    print("Case \(sequence): \((numbers[2] / numbers[1]) * numbers[0] + min(numbers[2] % numbers[1], numbers[0]))")
    sequence += 1
}

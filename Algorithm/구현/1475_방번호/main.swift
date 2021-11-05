//
//  main.swift
//  1475_방번호
//
//  Created by WANKI KIM on 2021/10/29.
//

import Foundation

let input = Array(readLine()!).map { Int(String($0))! }

var number = [Int].init(repeating: 0, count: 10)

input.forEach {
    if $0 == 9 {
        number[6] += 1
    } else {
        number[$0] += 1
    }
}
number[6] = number[6] / 2 + number[6] % 2
print(number.max()!)




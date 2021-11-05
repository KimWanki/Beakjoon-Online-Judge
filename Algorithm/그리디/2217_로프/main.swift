//
//  main.swift
//  2217_로프
//
//  Created by WANKI KIM on 2021/11/01.
//

import Foundation

let input = Int(readLine()!)!

var result: [Int] = []

for _ in 0..<input {
    result.append(Int(readLine()!)!)
}

result.sort(by: >)

var max = -1

for (index, value) in result.enumerated() {
    if max < value * (index+1) {
        max = value * (index+1)
    }
}

print(max)

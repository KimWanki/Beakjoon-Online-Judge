//
//  main.swift
//  1654_랜선 자르기
//
//  Created by WANKI KIM on 2021/10/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let K = input[0], N = input[1]
var lines: [Int] = []


(0..<K).forEach { _ in
    lines.append(Int(readLine()!)!)
}
var maxValue = lines.reduce(0, +) / N

var result = 0

while true {
    var totalCount = 0
    var remainders: [Int] = []
    for line in lines {
        let count = line / maxValue
        totalCount += count
        remainders.append(maxValue - (line / (count+1)))
    }
    if totalCount >= N {
        break
    }
    maxValue -= remainders.min()!
}

print(maxValue)







//
//  main.swift
//  1744_수_묶기
//
//  Created by WANKI KIM on 2021/09/10.
//

import Foundation

let numberOfCount = readLine()!
var list: [Int] = []
if numberOfCount == "0" {
    print(0)
    exit(0)
}
for _ in 1...Int(numberOfCount)! {
    list.append(Int(readLine()!)!)
}

var positive = list.filter { $0 > 0 }.sorted { $0 > $1 }
var negative = list.filter { $0 <= 0 }.sorted { $0 < $1 }

var result: Int = 0
while positive.count >= 2 {
    let max = positive.removeFirst()
    let subMax = positive.removeFirst()
    if max * subMax > max + subMax {
        result += max * subMax
    } else {
        result += (max + subMax)
    }
}

while negative.count >= 2 {
    let min = negative.removeFirst()
    let subMin = negative.removeFirst()
    if min * subMin > min + subMin {
        result += min * subMin
    } else {
        result += (min + subMin)
    }
}

if positive.count != 0 {
    result += positive.first!
}

if negative.count != 0 {
    result += negative.first!
}

print(result)

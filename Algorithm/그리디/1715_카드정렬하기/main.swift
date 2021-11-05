//
//  main.swift
//  1715_카드정렬하기
//
//  Created by WANKI KIM on 2021/09/07.
//

import Foundation

var result: Int = 0
let inputCount = Int(readLine()!)!

var numberList: [Int]  = []
for _ in 0 ..< inputCount {
    numberList.append(Int(readLine()!)!)
}

while numberList.count >= 2 {
    numberList.sort { $0 < $1 }
    let first = numberList.removeFirst()
    let second = numberList.removeFirst()
    result += (first + second)
    numberList.append(first + second)
}

print(result)



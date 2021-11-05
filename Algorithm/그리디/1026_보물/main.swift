//
//  main.swift
//  1026_보물
//
//  Created by WANKI KIM on 2021/10/31.
//

import Foundation

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int(String($0))! }
A.sort(by: <)
var B = readLine()!.split(separator: " ").map { Int(String($0))! }
B.sort(by: >)
var result = 0
for index in 0..<N {
    result += A[index] * B[index]
}

print(result)

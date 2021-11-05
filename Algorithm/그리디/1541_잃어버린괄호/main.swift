//
//  main.swift
//  1541_잃어버린괄호
//
//  Created by WANKI KIM on 2021/10/31.
//

import Foundation

//let input = Array(readLine()!).map { String($0) }
let input = readLine()!
var numbers = input.components(separatedBy: ["+","-"]).map { Int($0)! }

var operation: [String] = []
for v in input {
    if v == "+" || v == "-" {
        operation.append(String(v))
    }
}
var result = numbers[0]
var index = 0

while !operation.isEmpty {
    if index == operation.count { break }
    if operation[index] == "+" {
        numbers[index] = numbers[index] + numbers[index+1]
        
    }
}
print(numbers)
print(operation)





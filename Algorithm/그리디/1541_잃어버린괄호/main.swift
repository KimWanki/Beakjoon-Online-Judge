//
//  main.swift
//  1541_잃어버린괄호
//
//  Created by WANKI KIM on 2021/10/31.
//

import Foundation

let input = readLine()!
var numbers = input.components(separatedBy: ["+","-"]).map { Int($0)! }

var operations = Array(input).filter { char in
    return String(char) == "+" || String(char) == "-"
}.map { String($0) }

var numberStack: [Int] = [numbers[0]]
var operationStack: [String] = []

for (index, number) in numbers[1...].enumerated() {
    if operations[index] == "+" {
        let num = numberStack.popLast()!
        numberStack.append(num + number)
    } else {
        numberStack.append(number)
        operationStack.append(operations[index])
    }
}
if operationStack.isEmpty {
    print(numberStack.first!)
} else {
    print(numberStack[0] + numberStack[1...].reduce(0,-))
}

//var operation: [String] = []
//for v in input {
//    if v == "+" || v == "-" {
//        operation.append(String(v))
//    }
//}
//var result = numbers[0]
//var index = 0
//
//while !operation.isEmpty {
//    if index == operation.count { break }
//    if operation[index] == "+" {
//        numbers[index] = numbers[index] + numbers[index+1]
//
//    }
//}
//print(numbers)
//print(operation)





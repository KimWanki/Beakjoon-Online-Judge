//
//  main.swift
//  1978_소수찾기
//
//  Created by WANKI KIM on 2021/11/14.
//

import Foundation

func primeNumber(_ M: Int, _ N: Int) -> [Int] {
    if (N <= 1) { return [] }
    
    var primeArray = [Bool](repeating: true, count: N+1)
    primeArray[1] = false
    let m = sqrt(Double(N))
    for i in stride(from: 2, to: m+1 , by: 1) {
        if primeArray[Int(i)] == true {
            for j in stride(from: i+i, to: Double(N)+1, by: i) {
                primeArray[Int(j)] = false
            }
        }
    }
    
    var result = [Int]()
    for i in M...N {
        if primeArray[i] == true {
            result.append(i)
        }
    }
    return result
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = input[0], N = input[1]

let primeNumbers = primeNumber(M, N)

primeNumbers.forEach { print($0) }


//let primeNumbers = primeNumber(1000)
//
//_ = Int(readLine()!)!
//
//let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
//
//var result = 0
//
//for number in numbers {
//    if primeNumbers.contains(number) {
//        result += 1
//    }
//}
//
//print(result)

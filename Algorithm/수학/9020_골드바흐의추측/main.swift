//
//  main.swift
//  9020_골드바흐의추측
//
//  Created by WANKI KIM on 2021/09/14.
//

import Foundation


let input = Int(readLine()!)!

func solution() {
    let input = Int(readLine()!)!
    var primeNumber: [Int] = [2]
    var isPrime = true
    for num in 3...input {
        isPrime = true
        for i in 2...Int(ceil(sqrt(Double(num)))) {
            if num % i == 0 {
                isPrime = false
                break
            }
        }
        if isPrime {
            primeNumber.append(num)
        }
    }
    for num in stride(from: input/2, through: 0, by: -1) {
        if primeNumber.contains(num) && primeNumber.contains(input-num) {
            print("\(num) \(input-num)")
            break
        }
    }
}

for _ in 0..<input {
    solution()
}

//
//  main.swift
//  9461_파도반 수열
//
//  Created by WANKI KIM on 2021/09/16.
//

import Foundation

var input = [Int].init(repeating: 0, count: 90)
input.insert(contentsOf: [0,1,1,1,2,2,3,4,5,7,9], at: 0)

let testcase = Int(readLine()!)!

for _ in 0..<testcase {
    let number = Int(readLine()!)!
    if number <= 10 {
        print(input[number])
    } else {
        for value in 11...number {
            input[value] = input[value-1]+input[value-5]
        }
        print(input[number])
    }
}

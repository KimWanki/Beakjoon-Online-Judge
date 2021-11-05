//
//  main.swift
//  10162_전자레인지
//
//  Created by WANKI KIM on 2021/11/05.
//

import Foundation

let microwaves = [300, 60, 10]

var answer = [Int].init(repeating: 0, count: 3)

var input = Int(readLine()!)!

if input % 10 != 0 {
    print(-1)
    exit(0)
}
for (index, machine) in microwaves.enumerated() {
    answer[index] = input/machine
    input %= machine
}

answer.forEach { print($0, terminator: " ") }

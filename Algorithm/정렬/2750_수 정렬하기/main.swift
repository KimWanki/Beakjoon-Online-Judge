//
//  main.swift
//  2750_수 정렬하기
//
//  Created by WANKI KIM on 2021/11/14.
//

import Foundation

let number = Int(readLine()!)!

var numbers = [Int]()
for _ in 0..<number {
    numbers.append(Int(readLine()!)!)
}
numbers.sort()
numbers.forEach { print($0) }


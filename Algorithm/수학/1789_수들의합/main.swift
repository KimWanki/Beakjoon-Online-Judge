//
//  main.swift
//  1789_수들의합
//
//  Created by WANKI KIM on 2021/11/03.
//

import Foundation

let input = Int(readLine()!)!
var num = 1
while num * (num + 1) / 2 <= input {
    num += 1
}
print(num-1)

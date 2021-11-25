//
//  main.swift
//  11720_숫자의합
//
//  Created by WANKI KIM on 2021/11/15.
//

import Foundation

let _ = readLine()!
let input = Array(readLine()!).map{ Int(String($0))! }
print(input.reduce(0, +))

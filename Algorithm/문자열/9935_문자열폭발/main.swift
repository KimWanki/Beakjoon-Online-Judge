//
//  main.swift
//  9935_문자열폭발
//
//  Created by WANKI KIM on 2021/09/14.
//

import Foundation

var input = readLine()!.map { String($0) }
var eraseString = readLine()!.map { String($0) }
let eraseStringCount = eraseString.count
var stack = [String]()
for letter in input {
    if stack.count < eraseStringCount - 1 {
        stack.append(letter)
    } else {
        stack.append(letter)
        var check = true
        for i in 0 ..< eraseStringCount {
            if stack[stack.count - 1 - i] != eraseString[eraseStringCount - 1 - i] {
                check = false
                break
            }
        }
        if check {
            stack.removeLast(eraseStringCount)
        }
    }
}
if stack.isEmpty {
    print("FRULA")
} else {
    print(stack.joined())
}

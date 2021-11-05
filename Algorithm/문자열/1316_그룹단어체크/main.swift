//
//  main.swift
//  1316_그룹단어체크
//
//  Created by WANKI KIM on 2021/09/17.
//

import Foundation

// input: N ( N <= 100 )
// N개의 단어

func solution() -> Int {
    var alphabet = Set<String>()
    var value = readLine()!.map { String($0) }
    var prefixValue = value[0]
    var check = true
    for letter in value {
        if !alphabet.contains(letter) {
            alphabet.insert(letter)
            prefixValue = letter
        } else {
            if prefixValue != letter {
                check = false
                break
            }
        }
    }
    return check ? 1 : 0
}
var result = 0
for _ in 0..<Int(readLine()!)! {
    result += solution()
}
print(result)

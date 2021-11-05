//
//  main.swift
//  Problem1
//
//  Created by WANKI KIM on 2021/09/04.
//
//  단어 수학 성공
//
// 민식이는 수학학원에서 단어 수학 문제를 푸는 숙제를 받았다.
//
// 단어 수학 문제는 N개의 단어로 이루어져 있으며, 각 단어는 알파벳 대문자로만 이루어져 있다. 이때, 각 알파벳 대문자를 0부터 9까지의 숫자 중 하나로 바꿔서 N개의 수를 합하는 문제이다. 같은 알파벳은 같은 숫자로 바꿔야 하며, 두 개 이상의 알파벳이 같은 숫자로 바뀌어지면 안 된다.
//
// 예를 들어, GCF + ACDEB를 계산한다고 할 때, A = 9, B = 4, C = 8, D = 6, E = 5, F = 3, G = 7로 결정한다면, 두 수의 합은 99437이 되어서 최대가 될 것이다.
//
// N개의 단어가 주어졌을 때, 그 수의 합을 최대로 만드는 프로그램을 작성하시오.

import Foundation

let value = readLine()!
var alphaDictionary: [String: Int] = .init()
var words: [Int] = .init(repeating: 0, count: 26)

for _ in 1...Int(value)! {
    let newWord = readLine()!
    let count = newWord.count
    for (index, char) in newWord.enumerated() {
        let asciiValue = char.asciiValue! - 65
        let size = count - index - 1
        let value = Int(pow(10, Double(size)))
        words[Int(asciiValue)] += value
    }
}

words.sort(by: >)

var result: Int = 0
for (index, value) in (0...9).enumerated() {
    result += words[index] * (9 - value)
}

print(result)



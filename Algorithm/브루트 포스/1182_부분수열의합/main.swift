//
//  main.swift
//  1182_부분수열의합
//
//  Created by Luyan on 2021/09/29.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }

// count: numbers 개수
// answer: 정답값
// numbers: 입력된 숫자 배열
let count = input[0]
let answer = input[1]
let numbers = readLine()!.split(separator: " ").map{ Int($0)! }

// answer: 조건을 만족하는 경우의 수
var result = 0

func check(to r: Int, index: Int, sum: Int, count: Int) {
    if index == r {
        if sum == answer && count != 0 {
            result += 1
        }
        return
    }
    check(to:r, index: index+1, sum: sum+numbers[index], count: count+1)
    check(to:r, index: index+1, sum: sum, count: count)
}

check(to: count, index: 0, sum: 0, count: 0)


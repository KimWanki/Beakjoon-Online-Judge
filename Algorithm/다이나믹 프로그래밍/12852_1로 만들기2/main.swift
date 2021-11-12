//
//  main.swift
//  12852_1로 만들기2
//
//  Created by WANKI KIM on 2021/11/12.
//
import Foundation

let input = Int(readLine()!)!

// 동적할당을 굳이 하지 않아도 큰 차이가 없는 듯 함.
var dpTable = [Int](repeating: 0, count: 1000001)
var pathTable = [Int](repeating: 0, count: 1000001)

dpTable[2] = 1
dpTable[3] = 1

func dp(num: Int) -> Int {
    if num == 1 {
        return 0
    }
    if dpTable[num] != 0 {
        return dpTable[num]
    } else {
        var minValue = 1000000000
        if num % 3 == 0 {
            if dp(num: num / 3) < minValue {
                minValue = dp(num: num / 3)
                pathTable[num] = num / 3
            }
        }
        if num % 2 == 0 {
            if dp(num: num / 2) < minValue {
                minValue = dp(num: num / 2)
                pathTable[num] = num / 2
            }
        }
        if dp(num: num - 1) < minValue {
            minValue = dp(num: num - 1)
            pathTable[num] = num - 1
        }
        
        dpTable[num] = minValue + 1
        
        return dpTable[num]
    }
}

print(dp(num: input))
var index = input
print("\(input)", terminator: " ")

while pathTable[index] != 0 {
    print("\(pathTable[index])",terminator: " ")
    index = pathTable[index]
}
if input != 1 { print("1") }



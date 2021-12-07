//
//  main.swift
//  11053_가장 긴 증가하는 부분 수열
//
//  Created by WANKI KIM on 2021/11/17.
//

//  MARK: 1. 문제 분석
//
//  MARK: 2. 풀이 계획
//
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
import Foundation
//
//let N = Int(readLine()!)!
//var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
//
//var sequenceCount = [Int](repeating:1, count:1_001)
//
//for index in 2...N {
//    var change = false
//    for i in 1...index-1 {
//        if numbers[index] <= numbers[i] {
//            sequenceCount[index] = sequenceCount[i]
//            change = true
//            break
//        }
//    }
//    if !change {
//        sequenceCount[index] = sequenceCount[index-1] + 1
//    }
//}
//print(numbers)
//print(sequenceCount)

let a = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: 1, count: 1001)

for i in 1..<a {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(dp)
print(dp.max()!)

//
//  MARK: 5. 돌아 보기
//

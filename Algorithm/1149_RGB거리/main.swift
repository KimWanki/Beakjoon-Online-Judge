//
//  main.swift
//  1149_RGB거리
//
//  Created by WANKI KIM on 2021/11/12.
//


//  MARK: 1. 문제 분석
//
//  MARK: 2. 풀이 계획
//
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
//import Foundation
//
//let N = Int(readLine()!)!
//
//var map = [Int](repeating: 0, count: N+1)
//
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//var currentIdx = 0
//var result = 0
//
//var minValue = 1000000000
//for (index, color) in input.enumerated() {
//    if color < minValue {
//        minValue = color
//        currentIdx = index
//    }
//}
//result += minValue
//
//for _ in 1..<N {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//
//    if currentIdx == 0 {
//        if input[1] > input[2] {
//            currentIdx = 2
//            result += input[2]
//        } else {
//            currentIdx = 1
//            result += input[1]
//        }
//    } else if currentIdx == 1 {
//        if input[0] > input[2] {
//            currentIdx = 2
//            result += input[2]
//        } else {
//            currentIdx = 0
//            result += input[0]
//        }
//    } else {
//        if input[0] > input[1] {
//            currentIdx = 1
//            result += input[1]
//        } else {
//            currentIdx = 0
//            result += input[0]
//        }
//    }
//}
//
//// 방향을 잘못 잡았다.
////
//// 90 100 101
////  1 200 300
//// 위와 같이 호출하는 순간 최적 상황을 찾아가려고 한다면 제대로된 해석이 불가능하다.
////
//
//print(result)
//
//  MARK: 5. 돌아 보기
//


import Foundation

let input = Int(readLine()!)!

var n = 0

while true {
    let value = 3 * n * n + 3 * n + 1
    if value >= input {
        break
    }
    n += 1
}
print(n+1)

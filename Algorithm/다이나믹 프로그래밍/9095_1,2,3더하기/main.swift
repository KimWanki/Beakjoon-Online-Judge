//
//  main.swift
//  9095_1,2,3더하기
//
//  Created by WANKI KIM on 2021/11/10.
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
//  MARK: 5. 돌아 보기
//

var list = [Int](repeating: 0, count: 11)
list[1] = 1
list[2] = 2
list[3] = 4
for index in 4..<11 {
    list[index] = list[index-3] + list[index-2] + list[index-1]
}

let input = Int(readLine()!)!

for _ in 0..<input {
    let num = Int(readLine()!)!
    print(list[num])
}

//
//  main.swift
//  16953_A->B
//
//  Created by WANKI KIM on 2021/11/08.
//
//  MARK: 1. 문제 분석
//
//  MARK: 2. 풀이 계획
//
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let A = input[0], B = input[1]


var minOperations = 1000000000

func dfs(currentValue: Int, count: Int) {
    if B <= currentValue {
        if currentValue == B {
            minOperations = minOperations > count ? count : minOperations
        }
        return
    }
    dfs(currentValue: currentValue*2, count: count+1)
    dfs(currentValue: currentValue*10+1, count: count+1)
}

dfs(currentValue: A, count: 1)

minOperations == 1000000000 ? print(-1): print(minOperations)


//
//  MARK: 5. 돌아 보기
//

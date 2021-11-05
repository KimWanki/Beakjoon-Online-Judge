//
//  main.swift
//  1018_체스판다시칠하기
//
//  Created by WANKI KIM on 2021/10/15.
//
//  MARK: 1. 문제 분석
//  8 * 8 크기의 체스판을 추출해야 한다.
//  MARK: 2. 풀이 계획
//
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var map = Array(repeating: Array(repeating: "", count: M), count: N)

for i in 0..<N {
    for (j, character) in readLine()!.enumerated() {
        map[i][j] = String(character)
    }
}

print(map)

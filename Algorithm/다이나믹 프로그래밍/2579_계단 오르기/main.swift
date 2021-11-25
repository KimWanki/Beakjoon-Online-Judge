//
//  main.swift
//  2579_계단 오르기
//
//  Created by WANKI KIM on 2021/11/16.
//
//  MARK: 1. 문제 분석
//
//  MARK: 2. 풀이 계획
//  전체 문제 : N번째 시점에서 현재 시점에서 가질 수 있는 최대 점수를 구한다
//  부분 문제 : 각 위치에서 현재 가질 수 있는 점수를 구한다.
//  제한 조건 : 연속적인 값을 모두 더할 수 없다.
//          : 연속적인 부분에 대한 제한을 걸어야한다.
//          : 연속적인 합이 이뤄졌다는 부분에 대한 체크는 어떻게 할 수 있을까?
//          :
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드

import Foundation

let N = Int(readLine()!)!

var scores = [Int](repeating: 0, count: 300 + 1)
var maxScore = [Int](repeating: 0, count: 300 + 1)

for index in 1...N {
    scores[index] = Int(readLine()!)!
}
// 초기 값 설정
maxScore[1] = scores[1]
maxScore[2] = maxScore[1] + scores[2]
maxScore[3] = scores[1] > scores[2] ? scores[1] + scores[3] : scores[2] + scores[3]
if N < 3 {
    print(maxScore[N])
    exit(0)
}

for index in 3...N {
    maxScore[index] = maxScore[index-3]+scores[index-1]+scores[index] > maxScore[index-2]+scores[index] ?
    maxScore[index-3]+scores[index-1]+scores[index] : maxScore[index-2]+scores[index]
}

print(maxScore[N])

//
//  MARK: 5. 돌아 보기
//

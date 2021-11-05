//
//  main.swift
//  11399_ATM
//
//  Created by WANKI KIM on 2021/10/28.
//
//  MARK: 1. 문제 분석
//
//  1 ~ N번
//  입력 값은 각각 index에 해당하는 사람이 돈을 인출하는데 걸리는 시간
//
//  MARK: 2. 풀이 계획
//
//  (1 ≤ Pi ≤ 1,000)
//  입력은 작다.
//  인출하는데 걸리는 시간이 많이 걸리는 사람이 앞에 있을 경우에는 대기 시간이 증가한다.
//  대기 시간이 증가하면 전체 시간이 더 소요된다. 따라서 대기 시간을 짧게 유지하기 위해서는
//  빠르게 인출이 가능한 사람부터 돈을 인출하면 된다.
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
import Foundation

_ = readLine()!

var people = readLine()!.split(separator: " ").map{ Int(String($0))! }

people.sort()
var result = 0
var currentTime = 0
for one in people {
    currentTime += one
    result += currentTime
}
print(result)


//  MARK: 5. 돌아 보기
//

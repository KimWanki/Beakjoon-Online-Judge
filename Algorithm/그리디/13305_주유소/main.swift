//
//  main.swift
//  13305_주유소
//
//  Created by WANKI KIM on 2021/11/05.
//
//
//  MARK: 1. 문제 분석
//
//  왼쪽 도시를 기준으로 했을 떄, 가야하는 최대 경로를 고려하여 가장 싼 곳에서 기름을 가장 많이 사는 경우가 가장 최소의 값을 도출할 수 있게 한다.
//  하지만, 시작 점을 기준으로 최소값만 고려한다면, 원하는 지점까지 가지 못하는 경우가 생길 수 있다.
//
//  MARK: 2. 풀이 계획
//  입력 제한
//      - 도시의 개수 N(2 ≤ N ≤ 100,000)
//      - 도시 간 거리 N-1 ( 도시 수 - 1 )
//
//  출력 제한
//
//  현재 시점으로부터 자신보다 더 낮은 값을 가진 조건이 제공될 때까지의 거리에 대한 기름을 채운다.
//  더 낮은 가격 조건이 제시된 도시에서 다시 더 좋은 조건이 제공된 거리의 도시까지 가는 거리의 기름을 채운다.
//
//  MARK: 3. 계획 검증
//  최대 100,000개까지의 반복문이 돌아가야하기 때문에 시간 복잡도를 계산했을 때, O(N^2)이 되는 순간 10^12까지 돌아갈 수 있기 때문에 해당 로직은 불가능할 것 같다.
//  한번의 For 문 안에서 최대 경로까지의 거리를 다 찾아내야 한다.
//
//  MARK: 4. 소스 코드
//
import Foundation

let input = Int(readLine()!)!

let distances = readLine()!.split(separator: " ").map { Int(String($0))! }
let oilPrices = readLine()!.split(separator: " ").map { Int(String($0))! }

var minValue = oilPrices.first!
var currentIndex = 0

var currentDistance = 0

var result = 0

for (index, oilPrice) in oilPrices[1...].enumerated() {
    currentDistance += distances[index]
    if index == (oilPrices[1...].count - 1) {
        result += (currentDistance * minValue)
        break
    }
    if minValue > oilPrice {
        result += (currentDistance * minValue)
        currentDistance = 0
        minValue = oilPrice
    }
}

print(result)

//
//  MARK: 5. 돌아 보기
//
//  전형적인 그리디 알고리즘 문제. 각 순간에서의 최선 선택이 최적 결과를 나타낼 수 있는 알고리즘.
//  입력 순서를 고려하지 않고 문제를 풀고 있다가 뒤늦게 디버깅 과정에서 알 수 있었다.
//  무엇보다도 문제를 잘 읽자



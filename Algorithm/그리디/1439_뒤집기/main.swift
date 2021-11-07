//
//  main.swift
//  1439_뒤집기
//
//  Created by WANKI KIM on 2021/11/07.
//

import Foundation
//
//  MARK: 1. 문제 분석
//  0, 1로 이루어진 문자열이 있다.
//  모두 0이나 모두 1로 만들어서 문자열의 구성요소를 모두 동일하게 만들어주어야 한다.
//  MARK: 2. 풀이 계획
//  문자열 S의 최대 길이는 100만까지 가능하다.
//  for 반복문 한번으로 돌려야 2초 제한 시간에 가능할 것 같다.
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
import Foundation

let input = Array(readLine()!).map { Int(String($0))! }

var map = [Int](repeating: 0, count: 2)
var currentValue = input[0]
map[currentValue] += 1

for value in input[1...] {
    if value == currentValue {
        continue
    } else {
        currentValue = value
        map[currentValue] += 1
    }
}

print(map.min()!)

//
//  MARK: 5. 돌아 보기
//

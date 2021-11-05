//
//  main.swift
//  1463_1로만들기
//
//  Created by WANKI KIM on 2021/10/16.
//
//  MARK: 1. 문제 분석
//
//  divide by 3
//  divide by 2
//  minus 1
//  총 3가지 종류의 연산이 진행된다.
//  MARK: 2. 풀이 계획
//
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
import Foundation

let N = Int(readLine()!)!
var queue = [(value: Int, depth: Int)]()

var result = 0
let level = 0
queue.append((value: N, depth: level))

var checked = Array(repeating: false, count: N+1)
checked[N] = true

while true {
    let current = queue.removeFirst()
    if current.value == 1 {
        result = current.depth
        break
    }
    var nextNode = current.value / 3
    if current.value % 3 == 0 && checked[nextNode] == false {
        checked[nextNode] = true
        queue.append((nextNode, current.depth+1))
    }
    nextNode = current.value / 2
    if current.value % 2 == 0 && checked[nextNode] == false {
        checked[nextNode] = true
        queue.append((nextNode, current.depth+1))
    }
    nextNode = current.value-1
    if checked[nextNode] == false {
        checked[nextNode] = true
        queue.append((nextNode, current.depth+1))
    }
}
print(result)

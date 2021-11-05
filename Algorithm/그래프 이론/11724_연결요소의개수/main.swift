//
//  main.swift
//  11724_연결요소의개수
//
//  Created by WANKI KIM on 2021/10/15.
//
//  MARK: 1. 문제 분석
//  방향 없는 그래프가 주어졌을 때, 연결 요소(Connected Component
//  정점의 개수 N과 간선의 개수 M이 주어진다
//  MARK: 2. 풀이 계획
//
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
import Foundation

func search(_ index: Int) {
    var queue = [Int]()
    node[index] = 1
    queue.append(index)
    while !queue.isEmpty {
        let edge = queue.removeFirst()
        for (i, value) in map[edge].enumerated() {
            if node[i] == 1 { continue }
            if value == 1 {
                node[i] = 1
                queue.append(i)
            }
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var map = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
var node = Array(repeating: 0, count: N+1)

(0..<M).forEach { _ in
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    map[input[0]][input[1]] = 1
    map[input[1]][input[0]] = 1
}
var result: Int = 0
for index in 1...N {
    if node[index] == 1 {
        continue
    }
    search(index)
    result += 1
}


print(result)



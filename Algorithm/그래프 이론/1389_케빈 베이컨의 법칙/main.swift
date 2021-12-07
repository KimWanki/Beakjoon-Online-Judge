//
//  main.swift
//  1389_케빈 베이컨의 법칙
//
//  Created by WANKI KIM on 2021/12/07.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var map = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let start = input[0], end = input[1]
    map[start][end] = 1
    map[end][start] = 1
}

func bfs() -> Int {
    var minValue = Int.max
    var answer = 0
    for start in 1..<N+1 {
        var kevinNumber = [Int](repeating:0, count: N+1)
        var checked = [Int](repeating:0, count: N+1)

        var queue = [Int]()
        checked[start] = 1
        queue.append(start)
        
        while !queue.isEmpty {
            let point = queue.removeFirst()
            for index in 1..<N+1 {
                if map[point][index] == 1 && checked[index] == 0 {
                    queue.append(index)
                    kevinNumber[index] = kevinNumber[point] + 1
                    checked[index] = 1
                }
            }
        }
        if kevinNumber.reduce(0, +) < minValue {
            minValue = kevinNumber.reduce(0, +)
            answer = start
        }
    }
    return answer
}

print(bfs())

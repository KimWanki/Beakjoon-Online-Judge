//
//  main.swift
//  2606_바이러스
//
//  Created by WANKI KIM on 2021/11/26.
//

import Foundation

let N = Int(readLine()!)!
let connections = Int(readLine()!)!

var map = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)
var check = [Int](repeating: 0, count: N+1)

for _ in 0..<connections {
    let numbers = readLine()!.split(separator:" ").map { Int(String($0))! }
    let startEdge = numbers[0]
    let finishEdge = numbers[1]
    map[startEdge][finishEdge] = 1
    map[finishEdge][startEdge] = 1
}

func bfs() -> Int {
    var result = 0
    
    var queue = [Int]()
    queue.append(1)

    while !queue.isEmpty {
        let edge = queue.removeFirst()
        for idx in 1...N {
            if map[edge][idx] == 1 && check[idx] == 0 {
                check[idx] = 1
                result += 1
                queue.append(idx)
            }
        }
    }
    return result
}
check[1] = 1
print(bfs())

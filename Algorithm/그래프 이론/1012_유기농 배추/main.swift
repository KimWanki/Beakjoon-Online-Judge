//
//  main.swift
//  1012_유기농 배추
//
//  Created by WANKI KIM on 2021/11/25.
//

import Foundation

let testCase = Int(readLine()!)!

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

(0..<testCase).forEach { _ in
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    // 가로 : M, 세로 : N, 배추 위치 : K
    let M = input[0], N = input[1], K = input[2]
    
    var map = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    var checkMap = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    
    (0..<K).forEach { _ in
        let point = readLine()!.split(separator: " ").map { Int(String($0))! }
        let x = point[0], y = point[1]
        map[y][x] = 1
    }
    print(m_n까지배추찾기(M, N))
    
    func m_n까지배추찾기(_ m: Int, _ n: Int) -> Int {
        var queue = [(y: Int,x: Int)]()
        var result = 0
        for y in 0..<n {
            for x in 0..<m {
                if map[y][x] == 1 && checkMap[y][x] == 0 {
                    result += 1
                    checkMap[y][x] = 1
                    queue.append((y: y,x: x))
                    
                    while !queue.isEmpty {
                        let point = queue.removeFirst()
                        for i in 0..<4 {
                            let nextX = point.x + dx[i]
                            let nextY = point.y + dy[i]
                            if nextX>=0 && nextX<m && nextY>=0 && nextY<n {
                                if map[nextY][nextX] == 1 && checkMap[nextY][nextX] == 0 {
                                    checkMap[nextY][nextX] = 1
                                    queue.append((y: nextY, x: nextX))
                                }
                            }
                        }
                    }
                }
            }
        }
        return result
    }
}


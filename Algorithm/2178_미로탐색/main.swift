//
//  main.swift
//  2178_미로탐색
//
//  Created by WANKI KIM on 2021/11/25.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
// 오른쪽부터 시계 방향으로 탐색할 것.
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

let N = input[0], M = input[1]

var map: [[Int]] = []
var checked: [[Int]] = [[Int]](repeating: [Int](repeating: 0 , count: M), count: N)
var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0 , count: M), count: N)

for _ in 0..<N {
    map.append(Array(readLine()!).map{ Int(String($0))! })
}

//var minPath = Int.max

//func dfs(_ y: Int, _ x: Int, _ path: Int = 1) {
//    if y == N-1 && x == M-1 {
//        minPath = minPath > path ? path : minPath
//        return
//    } else {
//        for index in 0..<4 {
//            let nextX = x + dx[index]
//            let nextY = y + dy[index]
//            if nextX < M && nextX >= 0 && nextY < N && nextY >= 0 {
//                if map[nextY][nextX] == 1 {
//                    map[nextY][nextX] = 0
//                    dfs(nextY, nextX, path+1)
//                    map[nextY][nextX] = 1
//                }
//            }
//        }
//    }
//}
//
//dfs(0,0)

func bfs(_ y: Int, _ x: Int) {
    var queue = [(Int, Int)]()
    queue.append((y, x))
    
    while !queue.isEmpty {
        let point = queue.removeFirst()
        if point == (y-1, x-1) {
            return
        }
        for i in 0..<4 {
            let nextX = point.1 + dx[i]
            let nextY = point.0 + dy[i]
            if nextX < M && nextX >= 0 && nextY < N && nextY >= 0 {
                if map[nextY][nextX] == 1 && checked[nextY][nextX] == 0 {
                    checked[nextY][nextX] = 1
                    queue.append((nextY, nextX))
                    result[nextY][nextX] = result[point.0][point.1] + 1
                }
            }
        }
    }
}
result[0][0] = 1
bfs(0,0)
print(result[N-1][M-1])

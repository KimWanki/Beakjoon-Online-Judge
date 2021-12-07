//
//  main.swift
//  2667_단지번호붙이기
//
//  Created by WANKI KIM on 2021/11/22.
//

import Foundation

let input = Int(readLine()!)!

var map = [[Int]]()

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
for _ in 0..<input {
    let values = Array(readLine()!).map{ Int(String($0))! }
    map.append(values)
}

var result: [Int] = []
var sizeOfApart = 0
func dfs(_ x: Int, _ y: Int) {
    sizeOfApart += 1
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx>=0 && nx<input && ny>=0 && ny<input {
            if map[nx][ny] == 1 {
                map[nx][ny] = 0
                dfs(nx, ny)
            }
        }
    }
}

var cnt = 0
for i in 0..<input {
    for j in 0..<input {
        if map[i][j] == 1 {
            map[i][j] = 0
            sizeOfApart = 0
            dfs(i, j)
            result.append(sizeOfApart)
            cnt += 1
        }
    }
}

print(cnt)
result.sort()
result.forEach { print($0) }


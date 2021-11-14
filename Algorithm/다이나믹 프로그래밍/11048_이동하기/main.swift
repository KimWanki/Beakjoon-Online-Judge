//
//  main.swift
//  11048_이동하기
//
//  Created by WANKI KIM on 2021/11/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]
// N: 세로, M: 가로
var map = [[Int]]()

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for index in 1..<M { map[0][index] += map[0][index-1] }
for index in 1..<N { map[index][0] += map[index-1][0] }

for y in 1..<N {
    for x in 1..<M {
        map[y][x] = max(map[y][x-1],map[y-1][x]) + map[y][x]
    }
}

print(map[N-1][M-1])

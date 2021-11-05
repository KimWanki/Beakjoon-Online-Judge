//
//  main.swift
//  3109_빵집
//
//  Created by WANKI KIM on 2021/09/25.
//
import Foundation

let inputs = readLine()!.split(separator: " ").map { Int($0)!}

let r = inputs[0]
let c = inputs[1]

var map = [[Bool]]()

for _ in 0..<r {
    map.append(readLine()!.map { $0 == "."})
}

func dfs(y: Int, x: Int = 0) -> Bool {
    if x == c-1 {
        return true
    }
    
    for dy in (-1...1) {
        if y + dy >= 0 && y + dy < r {
            if map[y + dy][x+1] {
                map[y][x] = false
                if dfs(y: y + dy, x: x + 1) {
                    return true
                }
            }
        }
    }
    return false
}

var result = 0

for i in 0..<r {
    if dfs(y: i) { result += 1 }
}

print(result)

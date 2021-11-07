//
//  main.swift
//  1260_DFS와BFS
//
//  Created by WANKI KIM on 2021/10/05.
//

//  MARK: 1. 문제 분석
//
//  그래프를 DFS와 BFS로 출력한 결과를 보인다.
//
//  MARK: 2. 풀이 계획
//
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1], V = input[2]

var map = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)

for _ in 0..<M {
    let m = readLine()!.split(separator: " ").map { Int($0)! }
    map[m[0]][m[1]] = 1
    map[m[1]][m[0]] = 1
}

//
//  MARK: 5. 돌아 보기
//
var answer = "\(V)"
func dfs(_ v: Int, _ count: Int, _ result: String) -> Bool {
    if count == N-1 {
        answer = result
        print(answer)
        return true
    }
    for index in 1...N {
        if map[v][index] == 1 {
            if dfs(index, count+1, result+" \(index)") == true {
                return true
            }
        }
    }
    return false
}

dfs(V,0,answer)
print(answer)

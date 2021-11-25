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

//
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let N = input[0], M = input[1], V = input[2]
//
//var map = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)
//
//for _ in 0..<M {
//    let m = readLine()!.split(separator: " ").map { Int($0)! }
//    map[m[0]][m[1]] = 1
//    map[m[1]][m[0]] = 1
//}
//
//var visited = [Bool](repeating:false, count: N + 1)
////
////  MARK: 5. 돌아 보기
////
//var answer = "\(V)"
//func dfs(_ v: Int, _ count: Int, _ result: String) -> Bool {
//    if count == N-1 {
//        answer = result
//        print(answer)
//        return true
//    }
//    for index in 1...N {
//        if map[v][index] == 1 && visited[index] == false {
//            visited[index] = true
//            if dfs(index, count+1, result+" \(index)") == true {
//                return true
//            }
//        }
//    }
//    return false
//}
//visited[V] = true
//
//dfs(V,0,answer)
//print(answer)
//
//import Foundation
//
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let N = input[0], M = input[1], V = input[2]
//
//// var map = [[Int]](repeating: [Int](), count: 1001)
//// var check = [Bool](repeating: false, count: 1001)
//var map = [[Int]](repeating: [Int](repeating: 0, count: 1001), count: 1001)
//var check = [Int](repeating: 0, count: 1001)
//
//
//for _ in 1...M {
//    let edge = readLine()!.split(separator: " ").map{ Int(String($0))! }
//    let startVertex = edge[0]
//    let endVertext = edge[1]
//    check[startVertex] = 1
//    check[endVertext] = 1
//    map[startVertex][endVertext] = 1
//    map[endVertext][startVertex] = 1
//}
//
//var bfsChecked = check
//
//func dfs(_ vertex: Int) {
//    check[vertex] = 0
//    print("\(vertex) ",terminator: "")
//
//    for nextVertex in 1...N {
//        if map[vertex][nextVertex] == 1
//            && check[nextVertex] == 1 {
//            dfs(nextVertex)
//        }
//    }
//}
//
//func bfs(_ vertex: Int) {
//    var queue: [Int] = []
//    bfsChecked[vertex] = 0
//
//    queue.append(vertex)
//
//    while !queue.isEmpty {
//        let first = queue.removeFirst()
//        print("\(first) ", terminator: "")
//
//        for nextVertex in 1...N {
//            if map[first][nextVertex] == 1 &&
//                bfsChecked[nextVertex] == 1 {
//                bfsChecked[nextVertex] = 0
//                queue.append(nextVertex)
//            }
//        }
//    }
//}
//
//dfs(V)
//print()
//bfs(V)

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1], V = input[2]

var map = [[Int]](repeating: [Int](repeating: 0, count: 0), count: 1001)
var check = [Bool](repeating: false, count: 1001)

for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let startVertex = edge[0]
    let endVertext = edge[1]
    check[startVertex] = true
    check[endVertext] = true
    map[startVertex].append(endVertext)
    map[endVertext].append(startVertex)
}

var bfsChecked = check

for index in 1...N {
    map[index].sort()
}

func dfs(_ vertex: Int) {
    check[vertex] = false
    print("\(vertex) ",terminator: "")
    
    for nextVertex in map[vertex] {
        if check[nextVertex] == true {
            dfs(nextVertex)
        }
    }
}

func bfs(_ vertex: Int) {
    var queue: [Int] = []
    bfsChecked[vertex] = false
    queue.append(vertex)
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        print("\(first) ", terminator: "")
        
        for value in map[first] {
            if bfsChecked[value] == true {
                bfsChecked[value] = false
                queue.append(value)
            }
        }
    }
}

dfs(V)
print()
bfs(V)
print()

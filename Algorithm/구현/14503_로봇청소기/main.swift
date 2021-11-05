////
////  main.swift
////  14503_로봇청소기
////
////  Created by WANKI KIM on 2021/09/18.
////
//
//import Foundation
//
//// N(가로) * M(세로) 크기의 직사각형
//// 1 * 1 크기의 정사각형
//// 청소기 방향 : 동, 서, 남, 북 중 하나
//// (r: 북쪽으로부터 떨어진 칸의 개수, c: 서쪽에서부터 떨어진 칸의 개수)
////
//// 1. 현재 위치를 청소
//// 2. 현재 위치에서 방향 기준 왼쪽부터 차례대로 인접한 칸을 탐색.
////    - 왼쪽 방향 청소 가능 -> 왼쪽으로 이동 후 1번부터 진행
////    - 왼쪽 방향 청소 공간 없음 -> 그 방향으로 방향 회전 및 2번부터 진행
////
//// ㅁㅁㅁㅁㅁ
//// ㅁ북ㅁㅁㅁ
//// ㅁㅁㅁㅁㅁ
//// ㅁㅁㅁㅁㅁ
//
//// ㅁㅁㅁㅁㅁ
//// 서ㅁㅁㅁㅁ
//// ㅁㅁㅁㅁㅁ
//// ㅁㅁㅁㅁㅁ
//
//let dx = [0,-1,0,1]
//let dy = [-1,0,1,0]
//
//var input = readLine()!.split(separator: " ").map{Int(String($0))!}
//let n = input[0]
//let m = input[1]
//
//// 방문 체크를 위한 배열 선언
//var checked = Array(repeating: Array(repeating: 0, count: m), count: n)
//
//// 현재 청소기의 위치 선언
//var location = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//
//// 지도 상태 입력
//var map: [[Int]] = []
//for _ in 0..<n {
//    map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
//}
//// 청소 구역 개수
//var cleanPlace: Int = 0
//
//var y = location[0], x = location[1], currentDirection = location[2]
//
//while true {
//    if map[y][x] == 0 && checked[y][x] == 0 {
//        checked[y][x] = 1
//        cleanPlace += 1
//    }
//
//    let original = currentDirection
//
//    for _ in 0..<4 {
//        currentDirection = currentDirection == 3 ? 0 : currentDirection + 1
//        let xx = dx[currentDirection]
//        let yy = dy[currentDirection]
//        if map[y+yy][x+xx] != 1 && checked[y+yy][x+xx] == 0 {
//            x = x + xx
//            y = y + yy
//            break
//        }
//    }
//
//    if original == currentDirection && checked[y+dy[currentDirection]][x+dx[currentDirection]] != 0 {
//        if currentDirection == 0 {
//            if map[y+1][x] != 1 {
//                y = y+1
//            } else {
//                break
//            }
//        } else if currentDirection == 1 {
//            if map[y][x+1] != 1 {
//                x = x+1
//            } else {
//                break
//            }
//        }
//        else if currentDirection == 2 {
//            if map[y-1][x] != 1 {
//                y = y-1
//            } else {
//                break
//            }
//        }
//        else if currentDirection == 3 {
//            if map[y][x-1] != 0 {
//                x = x-1
//            } else {
//                break
//            }
//        }
//    }
//    for i in 0..<n {
//        for j in 0..<m {
//            print(checked[i][j], terminator: " ")
//        }
//        print("")
//    }
//}
//print(cleanPlace)

//
//  main.swift
//  14503_로봇청소기
//
//  Created by WANKI KIM on 2021/09/18.
//

import Foundation
// 북, 동, 남, 서
let dx = [0,1,0,-1]
let dy = [-1,0,1,0]

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let m = input[1]

// 현재 청소기의 위치 선언
var location = readLine()!.split(separator: " ").map{Int(String($0))!}

// 지도 상태 입력
var map: [[Int]] = []
for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 청소 구역 개수
var cleanPlace: Int = 0

var y = location[0], x = location[1], currentDirection = location[2]

while true {
    if map[y][x] == 0 {
        map[y][x] = 2
        cleanPlace += 1
    }
    
    var findNext = false
    
    for _ in 0..<4 {
        currentDirection = currentDirection == 0 ? 3 : currentDirection - 1
        let dx = dx[currentDirection]
        let dy = dy[currentDirection]
        if map[y+dy][x+dx] == 0  {
            x = x + dx
            y = y + dy
            findNext = true
            break
        }
    }
    if findNext { continue }
    
    let backward = (currentDirection - 2) >= 0 ? currentDirection - 2 : (currentDirection + 2)
    let dx = dx[backward]
    let dy = dy[backward]
    if map[y+dy][x+dx] == 2 {
        y = y+dy
        x = x+dx
    } else if map[y+dy][x+dx] == 1 {
        break
    }
    
}
print(cleanPlace)


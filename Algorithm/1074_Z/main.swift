//
//  main.swift
//  1074_Z
//
//  Created by WANKI KIM on 2021/11/26.
//
//
//import Foundation
//
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let N = input[0], r = input[1], c = input[2]
//let size = (pow(2, N) as NSDecimalNumber).intValue
//
//var map = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)
//
//var sequence = 0
//func dfs(_ xStart: Int, _ xEnd: Int, _ yStart: Int, _ yEnd: Int) {
////    if !(xStart <= r && r <= xEnd && yStart <= c && c <= yEnd) {
////        return
////    }
//    if xEnd-xStart == 1 {
//        map[xStart][yStart] = sequence
//        map[xStart][yEnd] = sequence + 1
//        map[xEnd][yStart] = sequence + 2
//        map[xEnd][yEnd] = sequence + 3
//        sequence += 4
//    } else {
//        if xStart <= r && r <= (xEnd+xStart)/2 && yStart <= c && c <= (yEnd+yStart)/2 {
//            dfs(xStart, (xEnd+xStart)/2, yStart, (yEnd+yStart)/2)
//        } else if xStart <= r && r <= (xEnd+xStart)/2 && (yEnd+yStart)/2 + 1 <= c && c <= yEnd {
//            dfs(xStart, (xEnd+xStart)/2, (yEnd+yStart)/2 + 1, yEnd)
//        } else if (xEnd+xStart)/2 + 1 <= r && r <= xEnd && yStart <= c && c <= (yEnd+yStart)/2 {
//            dfs((xEnd+xStart)/2 + 1, xEnd, yStart, (yEnd+yStart)/2)
//        } else if (xEnd+xStart)/2 + 1 <= r && r <= xEnd && (yEnd+yStart)/2 + 1 <= c && c <= yEnd {
//            dfs((xEnd+xStart)/2 + 1, xEnd, (yEnd+yStart)/2 + 1, yEnd)
//        }
//    }
//}

// MARK: 모든 위치에서의 값을 저장할 필요는 없음.
// 한 변의 길이가 최대 2^15이므로 (2^15)^2개의 메모리를 할당해야한다면, 메모리 초과가 발생할 수 있다.
// 따라서 해당 문제가 발생하지 않도록 하기 위해서는

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], r = input[1], c = input[2]
let size = (pow(2, N) as NSDecimalNumber).intValue

// var map = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)

var sequence = 0
func dfs(_ xStart: Int, _ xEnd: Int, _ yStart: Int, _ yEnd: Int) {
    if xEnd-xStart == 1 {
        if xStart == r && yStart == c {
            print(sequence)
            return
        }
        sequence += 1
        if xStart == r && yEnd == c {
            print(sequence)
            return
        }
        sequence += 1
        if xEnd == r && yStart == c {
            print(sequence)
            return
        }
        sequence += 1
        if xEnd == r && yEnd == c {
            print(sequence)
            return
        }
        sequence += 1
//        map[xStart][yStart] = sequence
//        map[xStart][yEnd] = sequence + 1
//        map[xEnd][yStart] = sequence + 2
//        map[xEnd][yEnd] = sequence + 3
//        sequence += 4
    } else {
        dfs(xStart, (xEnd+xStart)/2, yStart, (yEnd+yStart)/2)
        dfs(xStart, (xEnd+xStart)/2, (yEnd+yStart)/2 + 1, yEnd)
        dfs((xEnd+xStart)/2 + 1, xEnd, yStart, (yEnd+yStart)/2)
        dfs((xEnd+xStart)/2 + 1, xEnd, (yEnd+yStart)/2 + 1, yEnd)
    }
}

dfs(0,size-1,0,size-1)
//print(map[r][c])


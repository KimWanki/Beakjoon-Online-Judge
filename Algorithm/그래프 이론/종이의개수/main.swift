//
//  main.swift
//  종이의개수
//
//  Created by WANKI KIM on 2021/12/07.
//
//
//  MARK: 1. 문제 분석
//  입력: 첫째 줄에 N(1 ≤ N ≤ 3^7, N은 3^k 꼴)
//  출력: 첫째 줄 : -1로 채워진 종이의 개수, 0으로만 채워진 종이의 개수, 1로만 채워진 종이의 개수를 구해내는 프로그램
//
//  시간 제한 : 2초
//  메모리 제한: 256MB
//
//  MARK: 2. 풀이 계획
//
//  DFS로 완전탐색을 진행하면 될 것 같다.
//  탈출은 1개가 되거나, 혹은 해당 하는 영역에 채워진 모든 종이가 같은 경우 return 하도록 한다.
//
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
import Foundation

let N = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<N {
    let lineInfo = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(lineInfo)
}
var answer = [Int](repeating: 0, count: 3)

func dfs(_ xStart: Int, _ xEnd: Int, _ yStart: Int, _ yEnd: Int)  {
    let firstValue = map[yStart][xStart]
    
    var isSame: Bool = true
    if xStart == xEnd &&
        yStart == yEnd {
        answer[firstValue + 1] += 1
        return
    }
    
    for y in yStart...yEnd {
        for x in xStart...xEnd {
            if map[y][x] != firstValue {
                isSame = false
                break
            }
        }
        if !isSame {
            break
        }
    }
    if isSame {
        answer[firstValue + 1] += 1
        return
    }
    
    let interval = (xEnd-xStart+1)/3
    
    for y in stride(from: yStart, to: yEnd+1, by: interval) {
        for x in stride(from: xStart, to: xEnd+1, by: interval) {
            dfs(x,x+interval-1,y,y+interval-1)
        }
    }
}

dfs(0,N-1,0,N-1)

answer.forEach { print($0) }

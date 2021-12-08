//
//  main.swift
//  1992_쿼드트리
//
//  Created by WANKI KIM on 2021/12/08.
//
//
//  MARK: 1. 문제 분석
//  왼쪽 위, 오른쪽 위, 왼쪽 아래, 오른쪽 아래의  순서로 진행된다.
//  Z의 순서로 내부적인 분할 정복 알고리즘을 활용해 문제 풀이를 진행한다고 보면 될 것 같음.
//
//  MARK: 2. 풀이 계획
//
//  입력 예시
//  8
//  11110000
//  11110000
//  00011100
//  00011100
//  11110000
//  11110000
//  11110011
//  11110011
//
//  출력 결과 : (0(0011)(0(0111)01)1)
//  MARK: 3. 계획 검증
//  전형적인 분할 정복 문제로 보인다. 해당 영역을 할당하고, 이를 4분할해나가는 과정으로 풀이를 하면
//  문제가 풀릴 것으로 예상된다.
//
//  재귀 호출할 경우, 4분할 영역을 다뤄야 하기 때문에
//  반복문과 stride(from: to: interval: )을 활용하는 방안을 고려해볼 필요가 있음.
//  현재는 4개의 영역으로 나뉘기 때문에 stride를 사용하지 않고, dfs를 4번 호출하는 방법도 좋아보임.
//  MARK: 4. 소스 코드
import Foundation

let N = Int(readLine()!)!

var map = [[Int]]()

for _ in 0..<N {
    map.append(Array(readLine()!).map { Int(String($0))! })
}

func dfs(_ xStart: Int, _ xEnd: Int, _ yStart: Int, _ yEnd: Int) -> String {
    let firstValue = map[yStart][xStart]
    var isSame = true
    if xStart == xEnd && yStart == yEnd {
        return String(firstValue)
    }
    for y in yStart...yEnd {
        for x in xStart...xEnd {
            if firstValue != map[y][x] {
                isSame = false
                break
            }
        }
        if !isSame {
            break
        }
    }
    if isSame {
        return String(firstValue)
    }

    return """
    (\(dfs(xStart, (xStart+xEnd)/2, yStart, (yStart+yEnd)/2))\
    \(dfs((xStart+xEnd)/2 + 1, xEnd, yStart, (yStart+yEnd)/2))\
    \(dfs(xStart, (xStart+xEnd)/2, (yStart+yEnd)/2 + 1, yEnd))\
    \(dfs((xStart+xEnd)/2 + 1, xEnd, (yStart+yEnd)/2 + 1, yEnd)))
    """
}

print(dfs(0, N-1, 0, N-1))

//
//  MARK: 5. 돌아 보기
//
//  전형적인 dfs로 해결이 가능한 문항이었음.
//  조금더 고려해볼 수 있는 부분이라고 생각해본다면 만약 4개의 공간이 아니라 9개의 공간으로 나눈다고 한다면, 반복문을 활용한 풀이가 좀더 훨씬 편했을 것 같다는 생각이 든다.
//  Swift 반복문이 제공하는 stride에 대해서 좀더 사용법을 익히고 사용할 필요성이 있어 보인다.


//
//  main.swift
//  15652_N과M
//
//  Created by WANKI KIM on 2021/10/19.
//
//  MARK: 1. 문제 분석
//  1 ~ N의 자연수 중 M개를 고른 수열
//  같은 수 여러번 고르기 가능.
//  고른 수열은 비 내림차순이어야 함.
//  A1 ≤ A2 ≤ ... ≤ AK-1 ≤ AK
//  MARK: 2. 풀이 계획
//  1부터 N까지 가면서 출력을 하게 된다.
//  Back-tracking : 불필요한 탐색을 하지 않고, 이전 단계로 돌아와 다른 후보해를 탐색해 나가는 방법
//  이미 탐색한 값보다 작은 값의 경우, 다음 input으로 들어올 수 없으므로, 반복문 안에서 더 낮은 숫자의 반복문이 돌지 않도록 설정해주어야 하겠다.
//  -> for 문의 시작점을 현재의 current Value부터 시작하도록 설정해서 위 조건을 만족 시킴.
//
//  MARK: 3. 계획 검증
//  시간 복잡도는 고려하지 않았다. ( 1 ≤ M ≤ N ≤ 8 )
//  MARK: 4. 소스 코드
import Foundation

let value = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = value[0], M = value[1]
var result = ""
func dfs(currentValue: Int, count: Int, result: String) {
    // 반환 구문
    if count == M {
        print(result)
        return
    }
    for num in currentValue...N {
        dfs(currentValue: num, count: count+1, result: result + "\(num) ")
    }
}

dfs(currentValue: 1, count: 0, result: result)


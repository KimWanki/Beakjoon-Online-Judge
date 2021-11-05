//
//  main.swift
//  11047_동전0
//
//  Created by WANKI KIM on 2021/10/06.
//
//  MARK: 1. 문제 분석
//
//  MARK: 2. 풀이 계획
//
//  입력 제한
//  첫째 줄에 N과 K가 주어진다. (1 ≤ N ≤ 10, 1 ≤ K ≤ 100,000,000)
//  (1 ≤ Ai ≤ 1,000,000, A1 = 1, i ≥ 2인 경우에 Ai는 Ai-1의 배수)
//  가치가 더 큰 동전으로 가치가 더 작은 동전보다 더 적은 수를 활용해 합을 만들 수 있다.
//
//  MARK: 3. 계획 검증
//
//  n, k를 readLine()을 통해 입력 받고, SubString -> String -> Int로 형변환 한다.
//  큰 동전부터 만들 수 있는 최대를 만든다. 큰 동전으로 해를
//  MARK: 4. 소스 코드
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0)) }
var coins = [Int]()

let n = input[0]!
var k = input[1]!

var total = 0
(0..<n).forEach { _ in
    coins.append(Int(readLine()!)!)
}

for coin in coins.reversed() {
    if k == 0 {
        break
    }
    total += k/coin
    k %= coin
}
print(total)

// 돌아보기
// reverse() -> O(1)






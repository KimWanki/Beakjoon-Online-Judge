//
//  main.swift
//  18830_좌표압축
//
//  Created by WANKI KIM on 2021/10/03.
//
//  MARK: 1. 문제 분석
//
//  Xi의 값이 Xj보다 큰 좌표의 개수를 찾아야 한다.(좌표 압축)
//  Xi를 좌표 압축한 결과 = Xi`
//  입력: X1, X2, ..., XN
//  출력: X1`, X2`, ..., XN`
//  MARK: 2. 풀이 계획
//
//  입력 제한
//  1 ≤ N ≤ 1,000,000
//  -10^9 ≤ Xi ≤ 10^9
//  N^2으로 검증하는 순간 시간 초과는 분명.
//
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
//
import Foundation

var set = Set<Int>()
var dic = [Int: Int]()

_ = Int(readLine()!)!

var input = readLine()!.split(separator: " ").map { Int(String($0))! } // O(N) * O(1)

for value in input {
    set.insert(value)
}
input.forEach { set.insert($0) }

var sorted = Array(set).sorted(by: <)

for (idx, value) in sorted.enumerated() {
    dic.updateValue(idx, forKey: value)
}

for value in input {
    print(dic[value]!, terminator: " ")
}


//
//  MARK: 5. 돌아 보기
//
//  하단 코드에서 1번으로 할 경우엔 시간 초과가 나지 않았지만, 2번으로 실행할 경우에는 시간 초과가 발생했다.
//  var input = readLine()!.split(separator: " ").map { Int(String($0))! } // O(N) * O(1)
//
//  1) String.Substring -> String -> Int
//  1)    .map { Int(String($0))! }
//
//
//  2) String.Substring -> Int
//  2)    .map { Int($0)! }

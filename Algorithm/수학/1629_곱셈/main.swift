//
//  main.swift
//  1629_곱셈
//
//  Created by WANKI KIM on 2021/10/14.
//
//  MARK: 1. 문제 분석
//
//  1 <= A, B, C <= 2,147,483,647
//
//  A, B, C가 input으로 주어진다.
//  result = A * A * A * .... * A (총 B번 곱해짐)
//  result /= c
//
//  MARK: 2. 풀이 계획
//
//  A * A * A * ...
//  A를 계속 곱하고, 이를 C로 나눌 경우 오버플로우의 발생할 가능성이 있다.
//  A * A * A * A * A % C
//  MARK: 3. 계획 검증
//
//  B가 21억에 가까운 수일 경우, 시간 초과 발생.
//  O(n)
//  모듈러 연산 특징
//
//  MARK: 4. 소스 코드
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let A = input[0], B = input[1], C = input[2]

func divideAndConquer(value: Int, num: Int, mod: Int) -> Int {
    if num == 0 { return 1 }
    var result = divideAndConquer(value: value, num: num/2, mod: mod)
    result %= mod

    if num % 2 == 1 {
        return (value * ((result * result) % mod)) % mod
    } else {
        return (result * result) % mod
    }
}

print(divideAndConquer(value: A % C, num: B, mod: C) % C)

//  MARK: 5. 돌아 보기
//

//import Foundation
//
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//
//let A = input[0], B = input[1], C = input[2]
//
//func divideAndConquer(value: Int, num: Int, mod: Int) -> Int {
//    if num == 0 { return 1 }
//
//    if num % 2 == 1 {
//        let result = divideAndConquer(value: value, num: num/2, mod: mod)
//        return ((result%mod) * (result%mod))%mod
//    } else {
//        let result = divideAndConquer(value: value, num: num/2, mod: mod)
//        return ((result%mod) * (result%mod) * (value%mod))%mod
//    }
//}
//
//print(divideAndConquer(value: A, num: B, mod: C))



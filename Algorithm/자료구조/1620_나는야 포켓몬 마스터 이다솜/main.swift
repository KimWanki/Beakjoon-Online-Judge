//
//  main.swift
//  1620_나는야 포켓몬 마스터 이다솜
//
//  Created by WANKI KIM on 2021/12/10.
//

//
//  MARK: 1. 문제 분석
//
//  MARK: 2. 풀이 계획
//
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
import Foundation

let input = readLine()!.split(separator:" ").map { Int(String($0))! }
let N = input[0], M = input[1]

var pokemonInt = [String: String]()
var pokemonString = [String: String]()


for index in 1...N {
    let pocketMon = readLine()!
    pokemonInt.updateValue(String(index), forKey: pocketMon)
    pokemonString.updateValue(pocketMon, forKey: String(index))
}

for _ in 0..<M {
    let input = readLine()!
    if pokemonInt[input] != nil {
        print(pokemonInt[input]!)
    } else {
        print(pokemonString[input]!)
    }
}
//
//  MARK: 5. 돌아 보기
//

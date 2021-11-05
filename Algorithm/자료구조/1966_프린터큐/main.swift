//
//  main.swift
//  1966_프린터큐
//
//  Created by WANKI KIM on 2021/10/09.
//

import Foundation
//  MARK: 1. 문제 분석

//  MARK: 2. 풀이 계획
//
//  MARK: 3. 계획 검증
//
//  MARK: 4. 소스 코드
import Foundation

let testcase = Int(readLine()!)!

var list = [(Int, Int)]()

for _ in 0..<testcase {
    var result = 0
    let inputs = readLine()!.split(separator: " ").map { Int(String($0))!}
    var currentLocation = inputs[1]
    var values = readLine()!.split(separator: " ").map { Int(String($0))!}
    let targetValue = values[currentLocation]
    
    while true {
        // 값이 하나도 없을 경우.
        if values.isEmpty { break }
        // 해당 값이 원하는 값일 경우.
        if values.first == values.max() {
            result += 1
            // 첫 번째 값이 최댓 값인 경우 종료
            if currentLocation == 0 {
                break
            }
            values.removeFirst()
            currentLocation -= 1
        } else {
            values.append(values.removeFirst())
            currentLocation = currentLocation == 0 ? values.endIndex-1 : currentLocation - 1
        }
    }
    print(result)
    list.removeAll()    
}

//  MARK: 5. 돌아 보기
//



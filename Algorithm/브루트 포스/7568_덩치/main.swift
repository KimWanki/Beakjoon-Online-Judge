//
//  main.swift
//  7568_덩치
//
//  Created by WANKI KIM on 2021/09/12.
//

import Foundation

final class BodySize {
    let weight: Int
    let height: Int
    
    init(_ weight: Int, _ height: Int) {
        self.weight = weight
        self.height = height
    }
    
    static func < (lhs: BodySize, rhs: BodySize) -> Bool {
        return lhs.height < rhs.height && lhs.weight < rhs.weight
    }
}

// 각 사람의 덩치 등수는 자신보다 더 "큰 덩치"의 사람의 수로 정해진다.
// 덩치 등수에 대한 해석을 다르다의 관점에서 봤던 부분이 문제 해결 실패의 원인이 됐다.
let count = Int(readLine()!)!

var members: [BodySize] = []
for _ in 0..<count {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    members.append(BodySize(input[0],input[1]))
}

for member in members {
    var value = 1
    for target in members {
        if member < target {
            value += 1
        }
    }
    print(value, terminator: " ")
}


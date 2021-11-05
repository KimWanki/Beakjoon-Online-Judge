//
//  main.swift
//  2312_수복원하기
//
//  Created by WANKI KIM on 2021/09/14.
//

import Foundation

func solution() {
    var input = Int(readLine()!)!
    var caseNumber = 2
    var count = 0
    while input != 1 {
        if input % caseNumber == 0 {
            count += 1
            input /= caseNumber
        } else {
            if count > 0 {
                print("\(caseNumber) \(count)")
                count = 0
            }
            caseNumber += 1
        }
    }
    print("\(caseNumber) \(count)")
}

let count = Int(readLine()!)!
for _ in 0..<count {
    solution()
}

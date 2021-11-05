//
//  main.swift
//  1931_회의실배정
//
//  Created by WANKI KIM on 2021/11/01.
//

import Foundation

let N = Int(readLine()!)!

var meetings = [(start: Int, end: Int)]()

for _ in 0..<N {
    let meeting = readLine()!.split(separator: " ").map { Int(String($0))!}
    meetings.append((start: meeting[0], end: meeting[1]))
}


let waiting = meetings
    .sorted { $0.start < $1.start }
    .sorted { $0.end < $1.end }
    

var result = 0
var end = 0
for value in waiting {
    if value.start >= end {
        result += 1
        end = value.end
    }
}

print(result)

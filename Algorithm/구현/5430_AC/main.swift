////
////  main.swift
////  5430_AC
////
////  Created by WANKI KIM on 2021/09/13.
////
//
//import Foundation
//
//let count = Int(readLine()!)!
//for _ in 0..<count {
//    var isforward = true
//    var hasError = false
//    let command = readLine()!
//    let length = Int(readLine()!)! - 1
//    var result: [Int] = readLine()!.split{ ["[", ",", "]"].contains($0) }.map{Int(String($0))!}
//
//    for char in command {
//        if char == "R" {
//            isforward.toggle()
//        } else if char == "D" {
//            if result.isEmpty {
//                hasError = true
//                break
//            }
//            if isforward {
//                result.removeFirst()
//            } else {
//                result.removeLast()
//            }
//        }
//    }
//    if hasError {
//        print("error")
//    } else {
//        if result.isEmpty {
//            print("[]")
//        } else {
//            var base: String = "["
//            let range = isforward ? Array(0...result.count) : Array(stride(from: result.count, through: 0, by: -1))
//            for i in range {
//                base += "\(result[i])"
//            }
//            base.removeLast()
//            print(base)
//        }
//    }
//}
//

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<(index-1)])
    }
}
let file = FileIO()


let count = file.readInt()
for _ in 0..<count {
    var hasError = false
    let command = file.readString()
    _ = file.readString()
    var result: [String] = file.readString().split{ ["[", ",", "]"].contains($0) }.map{String($0)}
    var isReversed = false
    for char in command {
        if char == "R" {
            isReversed.toggle()
        } else if char == "D" {
            if result.isEmpty {
                hasError = true
                break
            }
            else {
                
            }
            
        }
    }
    
    if hasError {
        print("error")
    } else {
        if result.isEmpty {
            print("[]")
            
        } else {
            var base: String = "["
            for number in result[0..<result.count-1] {
                base.append(("\(number),"))
            }
            base.append("\(result[result.count-1])]")
            print(base)
        }
    }
}



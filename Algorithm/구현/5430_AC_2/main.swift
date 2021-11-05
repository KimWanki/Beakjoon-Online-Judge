//
//  main.swift
//  5430_AC_2
//
//  Created by WANKI KIM on 2021/10/01.
//
// MARK: 1. 문제 분석 : 문제 상황 정리
//
// 언어에는 두 가지 함수 R(뒤집기)과 D(버리기)가 있음.
// - R은 뒤집는 함수, D는 첫 번째 숫자를 버리는 함수
// - Error: 배열이 비어있는데 D를 사용한 경우
//
// 예제 입력 :   1) Testcase 수
//             2) p        : 수행할 함수 (String)
//             3) n        : 배열에 들어있는 수 개수
//             4) [xi,...] : 수가 들어가 있는 배열
// 제한 조건 : Sum(P) + n <= 700,000

// MARK: 2. 풀이 계획 : 알고리즘 말로 적어보기
//
// n의 길이에 대해 p를 순차적으로 수행한다.
// removeFirst()의 경우, 시간복잡도가 O(n)
// removeLast()의 경우, 시간복잡도가 O(1)
//
// 따라서 removeFirst() 메서드를 사용하게 될 경우, 꽤나 많은 비용이 들어갈 수 있음을 인지할 수 있다.
//
// MARK: 3. 계획 검증
//
//
// MARK: 4. 소스 코드
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
    var deque = Deque<Int>.init(file.readString().split{ ["[", ",", "]"].contains($0) }.map{Int(String($0))!})
    
    for char in command {
        if char == "R" {
            deque.R()
        } else if char == "D" {
            if deque.isEmpty {
                hasError = true
                break
            }
            deque.D()
        }
    }
    if hasError {
        print("error")
    } else {
        if deque.isEmpty {
            print("[]")
        } else {
            var base = "["
            if deque.isReversed {
                for idx in stride(from: deque.tail, to: deque.head-1, by: -1) {
                    base.append("\(deque.storage[idx]),")
                }
            } else {
                for idx in stride(from: deque.head, to: deque.tail+1, by: 1) {
                    base.append("\(deque.storage[idx]),")
                }
            }
            base.removeLast()
            base.append("]")
            print(base)
        }
    }
}



// MARK: 5. 돌아 보기


//
//  main.swift
//  1759_암호만들기
//
//  Created by WANKI KIM on 2021/09/25.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let letters = readLine()!.split(separator: " ").map{ String($0) }.sorted()

let passwordSize = input[0]
let alphabetCount = input[1]

let vowel = ["a","e","i","o","u"]

var password = [String](repeating: "", count: 4)


func dfs(pw: String = "", index: Int = 0, letterIndex: Int = 0) {
    if index == passwordSize {
        if pw.count != passwordSize { return }
        var count = 0
        _ = pw.compactMap {
            if vowel.contains(String($0)) {
                count += 1
            }
        }
        if count >= 1 && passwordSize - count >= 2 {
            print(pw)
        }
        return
    } else {
        for i in stride(from: letterIndex, to: alphabetCount, by: 1) {
            dfs(pw: pw+letters[i], index: index+1, letterIndex: i+1)
        }
    }
}

dfs()



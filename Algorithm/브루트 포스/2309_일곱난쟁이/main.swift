//
//  main.swift
//  2309_일곱난쟁이
//
//  Created by WANKI KIM on 2021/10/26.
//

import Foundation

var hobits: [Int] = []
for _ in 0..<9 {
    hobits.append(Int(readLine()!)!)
}

hobits.sort(by: <)

var result: [Int] = []

func dfs(index:Int, dwarf: [Int], sum: Int) {
    if dwarf.count == 7 && sum == 100 {
        result = dwarf
        return
    }
    if index == 9 {
        return
    }
    var tmp = dwarf
    tmp.append(hobits[index])
    dfs(index: index+1, dwarf: tmp, sum: sum + hobits[index])
    dfs(index: index+1, dwarf: dwarf, sum: sum)
}

dfs(index: 0, dwarf: [], sum: 0)

result.forEach { print($0) }



func dfs(index: Int) {
    for value in index + 1..<9 {
        
    }
}

//
//  main.swift
//  15650_N과 M(2)
//
//  Created by WANKI KIM on 2021/11/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let N = input[0], M = input[1]

func dfs(_ start: Int = 1, _ result:String = "", _ count: Int = 0) {
    if count == M {
        print(result)
        return
    } else {
        for number in start...N {
            if N - number + 1 >= M - count {
                dfs(number+1, result+"\(number) ", count+1)
            }
        }
    }
}
 
dfs()

//
//  main.swift
//  11726_2xn 타일링
//
//  Created by WANKI KIM on 2021/11/10.
//

import Foundation

let input = Int(readLine()!)!
var dp: [Int] = [Int](repeating: 0, count: input+1)

if input < 3 {
    print(input)
} else {
    dp[1] = 1
    dp[2] = 2
        
    for index in 3..<input+1 {
        dp[index] = (dp[index - 1] + dp[index - 2])%10007
    }
    print(dp[input]%10007)
}

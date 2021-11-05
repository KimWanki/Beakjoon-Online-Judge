//
//  main.swift
//  4358_생태학
//
//  Created by WANKI KIM on 2021/09/20.
//

import Foundation

var dic = [String: Double]()

var totalCount: Double = 0
while let key = readLine() {
    if dic[key] != nil {
        dic.updateValue(dic[key]! + 1, forKey: key)
    } else {
        dic.updateValue(1, forKey: key)
    }
    totalCount += 1
}
let result = dic.sorted { $0.key < $1.key }.map { (key, value) -> String in
    return key + String.init(format: " %.4f", (value / totalCount) * 100)
}
result.forEach {
    print($0)
}

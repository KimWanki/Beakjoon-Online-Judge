//
//  main.swift
//  1427_소트인사이드
//
//  Created by WANKI KIM on 2021/11/14.
//

import Foundation

var input = Array(readLine()!).map{ Int(String($0))! }
input.sort(by: >)

input.forEach {
    print($0, terminator:"")
}
print()

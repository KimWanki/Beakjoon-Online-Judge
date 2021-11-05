//
//  Deque.swift
//  5430_AC_2
//
//  Created by WANKI KIM on 2021/10/01.
//

import Foundation

public struct Deque<T> {
    var storage: [T] = []
    var head = 0
    var tail = 0
    
    var isReversed = false
    
    public init() {}
    
    mutating func R() {
        isReversed.toggle()
    }
    
    public init(_ element: [T]) {
        storage = element
        tail = element.count - 1
    }
    
    public mutating func enqueue(_ element: T) {
        storage.append(element)
        tail += 1
    }

    public mutating func D() {
        if isReversed {
                tail -= 1
        } else {
                head += 1
        }
    }
    
    public var isEmpty: Bool {
        return head > tail
    }
}

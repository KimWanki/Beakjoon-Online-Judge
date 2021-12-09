//
//  main.swift
//  7576_토마토
//
//  Created by WANKI KIM on 2021/12/09.
//
//  MARK: 1. 문제 분석
//  철수네 토마토 농장에서 토마토를 보관하는 큰 창고를 가지고 있다.
//  익은 토마토들의 인접한 곳에 있는 익지 않은 토마토들은 익은 토마토의 영향을 받아 익음.
//  대각선에 영향 X
//
//  MARK: 2. 풀이 계획
//  입력 :
//      첫 줄 : 2 ≤ M(가로), N(세로) ≤ 1,000
//      다음 줄 ~ : N개의 줄의 토마토 정보
//
//  MARK: 3. 계획 검증
//  bfs를 활용해서 완전 탐색을 할 수 있도록 해야 하겠다.
//  시간 제한이 1초
//
//
//  MARK: 4. 소스 코드
import Foundation
public class Node<Value> {
    public var value: Value
    public var before: Node?
    public var next: Node?
    
    public init(value: Value, before: Node? = nil, next: Node? = nil) {
        self.before = before
        self.value = value
        self.next = next
    }
}

public struct DoublyLinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(_ value: Value) {
        if head == nil {
            head = Node(value: value)
            tail = head
        } else {
            
        }
        
        
    }
}

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public class QueueLinkedList<T>: Queue {
    typealias Element = T
    private var list = DoublyLinkedList<T>()
    
    public init() {}
    
    func enqueue(_ element: T) {
        <#code#>
    }
    
    func dequeue() -> T? {
        <#code#>
    }
    
    var isEmpty: Bool
    
    var peek: T?
    
}

// Two Stack Algorithm
public struct QueueStack<T>: Queue {
    
    typealias Element = T
    
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    init() {}
    
    var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    var peek: T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    mutating func enqueue(_ element: T) {
        rightStack.append(element)
    }
    
    mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}

// 왼쪽, 오른쪽, 앞, 뒤 순
let dx = [-1, 1, 0, 0]
let dy = [0, 0, 1, -1]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = input[0], N = input[1]

var map = [[Int]]()
var checked = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func bfs() {
    var queue = QueueStack<(y: Int, x: Int)>()
    // 시작할 point들을 queue에 넣는다.
    for y in 0..<N {
        for x in 0..<M {
            if map[y][x] == 1 && checked[y][x] == 0 {
                checked[y][x] = 1
                queue.enqueue((y,x))
            }
        }
    }
    
    while !queue.isEmpty {
        guard let point = queue.dequeue() else { return }
        let currentValue = map[point.y][point.x]
        
        for i in 0..<4 {
            let nextY = point.y + dy[i]
            let nextX = point.x + dx[i]
            
            if nextX < 0 || nextX >= M || nextY < 0 || nextY >= N {
                continue
            }
            if map[nextY][nextX] == 0 && checked[nextY][nextX] == 0 {
                checked[nextY][nextX] = 1
                map[nextY][nextX] = currentValue + 1
                queue.enqueue((nextY, nextX))
            }
        }
    }
}

bfs()

let result = map.flatMap { $0 }

if result.contains(0) {
    print(-1)
} else {
    print(result.max()! - 1)
}

//
//  MARK: 5. 돌아 보기
//

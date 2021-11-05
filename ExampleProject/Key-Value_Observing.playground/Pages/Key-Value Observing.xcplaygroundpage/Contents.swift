import Foundation
// Key-Value Observing
// stock의 변화를 알고 싶을 때, value가 바뀌는 것
class Fruit: NSObject {
    @objc dynamic var stock: Int = 0
    @objc dynamic var color: String = ""
}

var banana = Fruit()

// key = \.stock
banana.observe(\.stock, options: [.old, .new]) { (fruit, change) in
    print(fruit.stock)
}
banana.observe(\.color, options: [.old, .new]) { (fruit, change) in
    print(change)
}

banana.stock = 10
banana.stock = 20
banana.stock = 0

banana.color = "0"

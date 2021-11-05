import UIKit

var greeting = "Hello, playground"

enum Fruit {
    case kiwi
    case mango
    case pineapple
    case strawberry
    case banana
}

var fruitStore = Dictionary<Fruit, Int>()

func checkFruit(target fruit: Fruit, on amount: Int) -> Bool? {
    fruitStore[fruit].flatMap { $0 >= amount }
}

//: [Previous](@previous)
import UIKit
import Foundation
// Notification
// 인스턴스끼리 주고 받는 시스템

// Notification Center - Nofitication을 발생시키는 곳(?)
//

// Fruit가 재고 수량이 변경되었다는 것을 NotificationCenter에 알려줌.
// NotificationCenter의 역할: YouTube
//
// | KVO | Notification 방식 간의 차이점 |
// |:-:|:-:|
// | 1 : 1| 1 : N |
// | Notificaiton은 받는 쪽에서 누가 받는지 모른다. |
//
// 어떤 걸 적용하는게 좋을까?
// 만들어 놓은 구조에 따라 어떤게 더 맞을지, 선택할 수 있어야한다.
// 둘다 써보고, 고민해보고 결정하면 되는 부분
//
// KVO를 쓰게 하기 위해 NSObject를 상속 받도록 하기도 한다.
// 상황에 따라서 다른 해석이 가능할 듯?
// 무조건 좋은 것은 없음 -> 상황에 대한 해석이 필요함
//
// 여러 시도들을 해봐야 함.
// 알림에 대한 정의
//
let yagomDidWinLotto = Notification.Name("yagomDidWinLotto")
let yaomgDidLostLotto = Notification.Name("yagomLostLotto")

class Person {
    @objc func didRecieveYagomDidLostLottoNotification(_ notification: Notification) {
        print("야곰은 로또에서 5천원 털림.")
    }
}

let coda = Person()
let jint = Person()

NotificationCenter.default.addObserver(coda,
                                 selector: #selector(Person.didRecieveYagomDidLostLottoNotification(_:)),
                                 name: yagomDidWinLotto,
                                 object: nil)

NotificationCenter.default.post(name: yagomDidWinLotto,
                          object: nil,
                          userInfo: nil)


NotificationCenter.default.removeObserver(coda)
// MVC도 역할을 서로 나눠도 일처리가 잘
//: [Next](@next)

//문항 1
//---
func address(of object: UnsafeRawPointer) -> String{
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}

// Copy on Write 관련 문항
// Q. 1 각 보기의 A와 B의 메모리 주소가 같은 것을 모두 고르시오.(1,3,4)\

// 1)
//
// let A = ["샬롯", "수박"]
// let B = A



// let A = ["샬롯", "수박"]
// var B = A
// B.append("루얀")


// 3)
//
//let A = "Hello World"
//let B = "Hello" + " " + "World"
//

// (O)
//
// 4)

let A = UIView()
var B = A
A.frame = CGRect()

// (O)
//
// https://developer.apple.com/swift/blog/?id=27
// https://stackoverflow.com/questions/46747363/how-to-prove-copy-on-write-on-string-type-in-swift
//
//
// weatherMembers와 newWeatherMembers의 메모리 주소는 서로 다르다.
//
// Q.2 다음은 final 키워드에 대한 설명이다. 아래 보기 중 맞는 것을 모두 고르시오.(1,3)
// 1. 상속을 막고자 할 때 사용이 가능하다. (O)
// 2. class, struct, enum 선언과 함께 사용할 수 있다. (X)
// 3. 컴파일 시점에 어떤 Method를 실행할 지 결정할 수 있다. (O)
// 4. Dynamic Dispatch로 동작하므로 런타임 효율성이 좋다. (X) //정적 디스패치
//
// final로 선언된 요소들은 직접 호출하는 반면, 그렇지 않은 요소들은 vtable을 통해 간접 호출되어 직접 호출되는 경우보다 느리게 작동.
//
// Q.3 다음 중 선언 시 generic parameters를 사용할 수 있는 타입을 모두 고르시오.
// 1. class 2. protocol 3.enum 4.struct
//
//  Q.4 다음 ChildClass는 SomeClass 를 상속할 수 있다.
// ```swift
// class SomeClass {
//
// }
//
// public class ChildClass: SomeClass {
//
// }
// ```
//
// Q.5 다음 샬롯의 식신로드에 나온 식당 중 [식당] - 메뉴와 연결이 잘못된 거은?
// 1. [동차밥] - 사케동
// 2. [칸다소바] - 마제 수박
// 3. [몽탄] - 우대 갈비
// 4. [강남명전] - 꿀 막걸리
//
//
// Q.6


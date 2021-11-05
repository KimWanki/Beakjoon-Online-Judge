//
//  ViewController.swift
//  captureValues
//
//  Created by WANKI KIM on 2021/08/26.
//

import UIKit


class ViewController: UIViewController {
    var array = [String]()
    var name: String = "뷰컨"
    //뷰컨의 인스턴스가 self, weak이 없으면 뷰컨에 강한참조를 함
    // 따라서 먼저 메모리가 해제되어야 하는데 강한참조를 하고 있어서
// 실행이 다 끝나야만 메모리에서 해제가 됨
    func doSomething(completion: () -> Void) {

        let serialQueue = DispatchQueue(label: "serial")


        for i in 1...20 {
            DispatchQueue.global().async {
                print("\(i)")
        //        array.append("\(i)")
                //  <===== 동시큐에서 실행하면 동시다발적으로 배열의 메모리에 접근
                
                serialQueue.async {
                    // 올바른 처리 ⭐️ - 어팬드를 하는 순간에 직렬큐에 넣기
                    self.array.append("\(i)")
                }
            }
        }
        completion()
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
    
    override func viewDidLoad() {
        doSomething {
            print(array)
        }
        
    }
}




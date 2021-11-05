//
//  ViewController.swift
//  FixingMVC
//
//  Created by WANKI KIM on 2021/09/27.
//

import UIKit

class ViewController: UIViewController {
    let myView = MyView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myView
    }
    
    
    override func loadView() {
        super.loadView()
        print(#function)
        
    }
//    @objc func tapButton() {
//        self.myView.button.centerXAnchor.constraint(equalTo: myView.centerXAnchor, constant: 40)
//    }
}

// That’s marked @nonobjc so it won’t conflict with any of Apple’s own code, now or in the future.
@nonobjc extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)
        if let frame = frame {
            child.view.frame = frame
        }
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}




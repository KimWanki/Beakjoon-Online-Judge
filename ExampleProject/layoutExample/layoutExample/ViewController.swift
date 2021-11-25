//
//  ViewController.swift
//  layoutExample
//
//  Created by WANKI KIM on 2021/11/16.
//

import UIKit

class ContainerView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("3. ContainterVC -", #function)
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
        print("6. ContainterVC -", #function)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("7. ContainterVC -", #function)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("8. ContainterVC -", #function)
    }
}


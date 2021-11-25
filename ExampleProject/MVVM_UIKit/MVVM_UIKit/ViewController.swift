//
//  ViewController.swift
//  MVVM_UIKit
//
//  Created by WANKI KIM on 2021/11/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        username.bind(to: user.name)
    }
    
    @IBOutlet var username: BoundTextField!
    
    var user = User(name: Observable("Pual Hudson"))
    
}


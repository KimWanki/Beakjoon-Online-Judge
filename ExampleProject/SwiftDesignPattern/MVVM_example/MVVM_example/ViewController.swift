//
//  ViewController.swift
//  MVVM_example
//
//  Created by WANKI KIM on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {
    var user = User(name: Observable("Luyan"))
    
    @IBOutlet weak var username: BoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.bind(to: user.name)
    }
}


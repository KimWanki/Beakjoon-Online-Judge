//
//  ViewController.swift
//  DateFormatExample
//
//  Created by WANKI KIM on 2021/08/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let result = DateFormatter.localizedString(from: Date(timeIntervalSince1970: 1608651333), dateStyle: .long, timeStyle: .none)
        print(result)
    }

}


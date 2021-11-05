//
//  ViewController.swift
//  UIViewAnimationTest
//
//  Created by WANKI KIM on 2021/09/16.
//

import UIKit

class ViewController: UIViewController {
    
    var aView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(aView)
    }
    
    func toggle(){
    hidesNavBar = !hidesNavBar
    navigationController?.navigationBar.isHidden = hidesNavBar
    UIView.animate(withDuration: 0.3) {
    self.view.setNeedsLayout()
    }
    }

}

extension ViewController {
    NSLayoutConstraint.activate([
    aView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
    aView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
    aView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    aView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
    ])
}

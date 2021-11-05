//
//  AnchorViewController.swift
//  AutoLayout_Example
//
//  Created by Luyan on 2021/10/07.
//

import UIKit

class AnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // safeArea의 영역을 나타내준다.
        let safeArea = view.safeAreaLayoutGuide
        
        // Anchor을 만들어주고, 바로 활성화
        // Code로 작성할 때는 constant의 부호를 잘 구분
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        let safeBottomAnchor = button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            
        safeBottomAnchor.isActive = true
        safeBottomAnchor.priority = .init(999)
        
        let viewBottomAnchor = button.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        
        viewBottomAnchor.isActive = true
        
        
        
        
    }
}

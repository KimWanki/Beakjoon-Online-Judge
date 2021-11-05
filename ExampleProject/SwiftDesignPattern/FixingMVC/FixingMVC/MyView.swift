//
//  MyView.swift
//  FixingMVC
//
//  Created by WANKI KIM on 2021/09/27.
//

import UIKit

class MyView: UIView {
    
    let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "야곰"
        button.titleLabel?.textColor = .red
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        self.layoutIfNeeded()
        setup()
    }
}

extension MyView {
    override func setNeedsLayout() {
        super.setNeedsLayout()
        print(#function)
    }
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        print(#function)
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        print(#function)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print(#function)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function)
    }
    
    func setup() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
}


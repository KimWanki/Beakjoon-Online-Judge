//
//  BoundTextField.swift
//  MVVM_example
//
//  Created by WANKI KIM on 2021/10/02.
//

import UIKit

class BoundTextField: UITextField {
    var changedClosure: (() -> ())?
    
    @objc func valueChanged() {
        changedClosure?()
    }

    func bind(to observable: Observable<String>) {
        addTarget(self, action: #selector(Self.valueChanged), for: .editingChanged)
        
        changedClosure = { [weak self] in
            observable.bindingChanged(to: self?.text ?? "" )
        }
        
        observable.valueChanged = { [weak self] newValue in
            self?.text = newValue
        }
    }
}

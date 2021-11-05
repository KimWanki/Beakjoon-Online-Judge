//
//  Observable.swift
//  MVVM_UIKit
//
//  Created by WANKI KIM on 2021/11/05.
//

import Foundation
import UIKit

class Observable<ObservedType> {
    private var _value: ObservedType?
    
    init(_ value: ObservedType) {
        _value = value
    }
    
    var valueChanged: ((ObservedType?) -> ())?
    
    private var value: ObservedType? {
        get {
            return _value
        }
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
        print("Value is now \(newValue)")
    }
}

class BoundTextField: UITextField {
    var changedClosure: (() -> Void)?
    
    @objc func valueChanged() {
        changedClosure?()
    }
    
    func bind(to observable: Observable<String>) {
        addTarget(self, action: #selector(BoundTextField.valueChanged), for: .editingChanged)
        
        changedClosure = { [weak self] in
            observable.bindingChanged(to: self?.text ?? " ")
        }
        
        observable.valueChanged = { [weak self] newValue in
            self?.text = newValue
        }
    }
}

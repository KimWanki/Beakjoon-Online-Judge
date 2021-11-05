//
//  Observable.swift
//  MVVM_example
//
//  Created by WANKI KIM on 2021/10/02.
//

import Foundation

class Observable<ObservedType> {
    private var _value: ObservedType?
    
    var valueChanged: ((ObservedType?) -> ())?
    

    public var value: ObservedType? {
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
    
    init(_ value: ObservedType) {
        _value = value
    }
    
}

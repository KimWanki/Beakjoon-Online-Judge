//
//  PlusButton.swift
//  CoreGraphicsTest
//
//  Created by WANKI KIM on 2021/10/29.
//
//
//import UIKit
//
//class PlusButton: UIButton {
//    
//    override func draw(_ rect: CGRect) {
//        guard let context = UIGraphicsGetCurrentContext() else { return }
//        
//        let width = rect.width
//        let height = rect.height
//        
//        let box = bounds.insetBy(dx: width * 0.25,
//                                 dy: height * 0.25)
//        
//        context.beginPath()
//        context.addEllipse(in: box)
//        context.setLineWidth(5)
//        context.setStrokeColor(CGColor.green)
//        context.drawPath(using: .stroke)
//    }
//}

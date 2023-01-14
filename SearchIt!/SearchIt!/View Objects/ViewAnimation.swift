//
//  ViewAnimation.swift
//  SearchIt!
//
//
//

//extension to UIView to provide custom animation

import UIKit

extension UIView {
    func imageShake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 10
        shake.autoreverses = true
        
        let frontPoint = CGPoint(x: self.center.x - 10, y: self.center.y)
        shake.fromValue = NSValue(cgPoint: frontPoint)
        let toPoint = CGPoint(x: self.center.x + 10, y: self.center.y)
        shake.toValue = NSValue(cgPoint: toPoint)
        self.layer.add(shake, forKey: "position")
    }
}

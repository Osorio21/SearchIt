//
//  ViewAnimation.swift
//  SearchIt!
//
//
//

//extension to UIView to provide custom animations to UIView objects

import UIKit

extension UIView {
    func imageShake() {
        
        //create animation object
        let shake = CABasicAnimation(keyPath: "position")
        
        //define animation properties
        shake.duration = 0.1
        shake.repeatCount = 10
        shake.autoreverses = true
        
        //define location movement points
        let frontPoint = CGPoint(x: self.center.x - 10, y: self.center.y)
        shake.fromValue = NSValue(cgPoint: frontPoint)
        let toPoint = CGPoint(x: self.center.x + 10, y: self.center.y)
        shake.toValue = NSValue(cgPoint: toPoint)
        
        //add animation
        self.layer.add(shake, forKey: "position")
    }
}

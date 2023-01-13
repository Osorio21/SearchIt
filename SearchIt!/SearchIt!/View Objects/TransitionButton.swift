//
//  TransitionButton.swift
//  SearchIt!
//
//  
//

//custom UIButton class

import UIKit

class TransitionButton: UIButton {
    
    init(frame: CGRect, label: String) {
        super.init(frame: frame)
        
        //text properties
        self.titleLabel?.font =  UIFont(name: "Gill Sans", size: 40)
        self.setTitle(label, for: .normal)
        
        //background color and border properties
        self.backgroundColor = UIColor.systemGray
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.black.cgColor
        
        //shadow properties
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 6)
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds = true
        self.layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

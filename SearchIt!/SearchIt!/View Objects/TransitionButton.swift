//
//  TransitionButton.swift
//  SearchIt!
//
//  
//

import UIKit

class TransitionButton: UIButton {
    
    init(frame: CGRect, label: String) {
        super.init(frame: frame)
        self.titleLabel?.font =  UIFont(name: "Gill Sans", size: 40)
        self.setTitle(label, for: .normal)
        self.backgroundColor = UIColor.systemGray
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

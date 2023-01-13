//
//  InputField.swift
//  SearchIt!
//
//  
//

import UIKit

class InputField: UITextField {
    
    init(frame: CGRect, placeholder: String) {
        super.init(frame: frame)
        self.placeholder = placeholder
        self.borderStyle = .roundedRect
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

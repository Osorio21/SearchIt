//
//  InputField.swift
//  SearchIt!
//
//  
//

//custom UITextFIeld class for input fields presented via InputTextContoller

import UIKit

class InputField: UITextField {
    
    init(frame: CGRect, placeholder: String) {
        super.init(frame: frame)
        
        //set placeholder text
        self.placeholder = placeholder
        
        //borderstyle property
        self.borderStyle = .roundedRect
        
        //set black borders
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    //not using storyboard
    required init?(coder: NSCoder) {
        fatalError()
    }
}

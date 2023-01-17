//
//  InputLabel.swift
//  SearchIt!
//
//
//

//custom UILabel class for input text field headers presented via InputTextController

import UIKit

class InputLabel: UILabel {
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        
        //set text properties
        self.text = title
        self.font = UIFont(name: "Gill Sans", size: 20)
        self.font = UIFont.boldSystemFont(ofSize: self.font.pointSize)
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

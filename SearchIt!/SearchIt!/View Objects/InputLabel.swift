//
//  InputLabel.swift
//  SearchIt!
//
//
//

import UIKit

class InputLabel: UILabel {
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        self.text = title
        self.font = UIFont(name: "Gill Sans", size: 20)
        self.font = UIFont.boldSystemFont(ofSize: self.font.pointSize)
        self.textAlignment = .center
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

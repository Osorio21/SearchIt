//
//  TitleLabel.swift
//  SearchIt!
//
//  
//

import UIKit

class TitleLabel: UILabel {
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        self.text = title
        self.font = UIFont(name: "Gill Sans", size: 60)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

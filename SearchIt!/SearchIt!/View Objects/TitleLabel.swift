//
//  TitleLabel.swift
//  SearchIt!
//
//  
//

//custom UILabel class for application title presented via HomeScreenController

import UIKit

class TitleLabel: UILabel {
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        
        //set text properties
        self.text = title
        self.font = UIFont(name: "Gill Sans", size: 60)
        self.textAlignment = .center
        
        //set shadow properties
        self.layer.shadowColor = CGColor(red: 204.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.masksToBounds = false
    }
    
    //not using storyboard
    required init?(coder: NSCoder) {
        fatalError()
    }
}

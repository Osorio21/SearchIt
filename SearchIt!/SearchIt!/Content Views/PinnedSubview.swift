//
//  PinnedSubview.swift
//  SearchIt!
//
//  
//

import UIKit

//reusable layout function for user input fields

extension UIView {
    
    //add subview that is pinned to superview
    func addPinnedSubview(_ subview: UIView, height: CGFloat? = nil, insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)) {
        
        //adds subview to bottom of superview's hierarchy
        addSubview(subview)
        
        //disable automatic constraints
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        //dynamically lay out view for any size or orientation
        //pin to top of superview
        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        
        //define horizontal padding
        subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1.0 * insets.right).isActive = true
        
        //bottom padding
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1.0 * insets.bottom).isActive = true
        
        //if height value is given constrain subview to height
        if let height = height {
            subview.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
            
    }
    
}

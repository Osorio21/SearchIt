//
//  BackgroundColor.swift
//  SearchIt!
//
//  
//

//custom struct that provides background color gradient for views

import UIKit

struct BackgroundColors {
    
    var colorTop: CGColor
    var colorBottom: CGColor
    let cgl: CAGradientLayer

    init(cgl: CAGradientLayer = CAGradientLayer(), colorTop: CGColor = CGColor(red: 0.0/255.0, green: 128.0/255.0, blue: 255.0/255.0, alpha: 1.0), colorBottom: CGColor = CGColor(red: 102.0/255.0, green: 178.0/255.0, blue: 255.0/255.0, alpha: 1.0)) {
        self.cgl = cgl
        self.colorTop = colorTop
        self.colorBottom = colorBottom
        self.cgl.colors = [self.colorTop, self.colorBottom]
        self.cgl.locations = [ 0.0, 1.0]
  }
}

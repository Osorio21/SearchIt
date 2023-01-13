//
//  BackgroundColor.swift
//  SearchIt!
//
//  
//

import UIKit

struct BackgroundColors {
  var colorTop = CGColor(red: 0.0/255.0, green: 128.0/255.0, blue: 255.0/255.0, alpha: 1.0)
  var colorBottom = CGColor(red: 102.0/255.0, green: 178.0/255.0, blue: 255.0/255.0, alpha: 1.0)

  let cgl: CAGradientLayer

  init() {
    cgl = CAGradientLayer()
    cgl.colors = [ colorTop, colorBottom]
    cgl.locations = [ 0.0, 1.0]
  }
}

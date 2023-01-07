//
//  BackgroundColor.swift
//  SearchIt!
//
//  Created by Brian Pinto on 1/7/23.
//

import UIKit

class Colors {
  let colorTop = CGColor(red: 0.0/255.0, green: 128.0/255.0, blue: 255.0/255.0, alpha: 1.0)
  let colorBottom = CGColor(red: 204.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)

  let cgl: CAGradientLayer

  init() {
    cgl = CAGradientLayer()
    cgl.colors = [ colorTop, colorBottom]
    cgl.locations = [ 0.0, 1.0]
  }
}

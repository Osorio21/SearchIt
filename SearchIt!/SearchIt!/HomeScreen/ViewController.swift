//
//  ViewController.swift
//  SearchIt!
//
//  Created by Brian Pinto on 1/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        background_refresh()
    }
    
    override func viewDidLayoutSubviews() {
        colors.cgl.frame = self.view.bounds
    }
    
    let colors = Colors()
    func background_refresh() {
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.cgl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
      }
    
    
    
}
        
    




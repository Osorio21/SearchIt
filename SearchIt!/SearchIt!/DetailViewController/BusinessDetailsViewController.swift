//
//  BusinessDetailsViewController.swift
//  SearchIt!
//
//  
//

import UIKit

class BusinessDetailsViewController: UIViewController {
    
    //declare Business object transferred from BusinessTableViewController
    var business: Business?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set background color
        view.backgroundColor = UIColor(red: 178.0/255.0, green: 102.0/255.0, blue: 1, alpha: 1.0)
        
        //force unwrap business object transferred from BTVC
        let businessData = business!
    }
}

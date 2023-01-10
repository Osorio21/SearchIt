//
//  TableViewController.swift
//  SearchIt!
//
//  Created by Brian Pinto on 1/9/23.
//

import UIKit

class TableViewController: UITableViewController {
    
    var business: [Business]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //return business object from array of businesses given id
    func business(for id: Business.ID) -> Business {
        let index = (business?.businessIndex(with: id))!
        return business![index]
    }
    
    
}

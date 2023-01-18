//
//  BDVCTableConfig.swift
//  SearchIt!
//
//  
//

//extension to BusinessDetailsViewController that provides table configuration functions

import UIKit

extension BusinessDetailsViewController {
    
    //set number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    //set number of rows per section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //set header text properties
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 25))
        label.textColor = UIColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 1)
        label.text = self.headerTitles[section]
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }
    
    //sets table cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    
}

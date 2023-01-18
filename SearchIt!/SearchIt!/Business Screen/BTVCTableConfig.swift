//
//  BTVCTableConfig.swift
//  SearchIt!
//
//
//

//extension to BusinessTableViewController that provides table configuration functions

import UIKit

extension BusinessTableViewController {
    
    //sets number of table cells to equal number of business objects generated from API call
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.businesses.count
    }
    
    //sets table cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

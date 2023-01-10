//
//  ILVC+CellConfiguration.swift
//  SearchIt!
//
//  
//

import UIKit

//configuration functions for various objects

extension InputListViewController {
    
    //text field configuration function
    func textFieldConfiguration(for cell: UICollectionViewListCell) -> TextFieldContentView.Configuration {
            let contentConfiguration = cell.textFieldConfiguration()
            return contentConfiguration
        }
    
    //header configuration function
    func headerConfiguration(for cell: UICollectionViewListCell, with title: String) -> UIListContentConfiguration {
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = title
        return contentConfiguration
        }
}

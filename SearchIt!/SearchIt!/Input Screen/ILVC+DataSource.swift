//
//  ILVC+DataSource.swift
//  SearchIt!
//
//  Created by Brian Pinto on 1/9/23.
//

import UIKit

//houses DataSource behaviors to clean up ILVC file

extension InputListViewController {
    
    typealias DS = UICollectionViewDiffableDataSource<Int,String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int,String>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: String) {
        let r = ["This", "is", "a", "test."]
        let a = r[indexPath.item]
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = a
        cell.contentConfiguration = contentConfig
    }
    
}

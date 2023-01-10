//
//  BusinessDetailViewController.swift
//  SearchIt!
//
//  
//

import UIKit

class BusinessDetailViewController: UICollectionViewController {
    
    
    var business: Business
    
    init(business: Business) {
        self.business = business
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func text(for row: Row) -> String? {
        switch row {
        case .name: return business.name
        case .address: return business.address
        case .phone: return business.phone
        case .web: return business.website
        case .description: return business.description
        default: return nil
        }
    }
    
}

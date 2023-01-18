//
//  InputListViewController.swift
//  SearchIt!
//
//  
//

import UIKit

class InputListViewController: UICollectionViewController {
    
    //create diffiable data source using typealias
    var dataSource: DS!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set collectionview layout
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        //set background color
        collectionView.backgroundColor = UIColor(red: 0.0, green: 204.0/255.0, blue: 102.0/255.0, alpha: 1)
        
        //default cell configuration
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        
        // connect diffable data source to collection view by passing in collection view to initializer of DDS
        // closure configures and returns cell for collection view
        dataSource = DS(collectionView: collectionView) {(collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Row) in
            
            //reuse cells for performance
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
        }
        
        
        
        
        updateSnapshot()
        
        
        
    }
    
    private func updateSnapshot() {
        
        //create snapshot
        var snapshot = Snapshot()
        
        //append sections
        snapshot.appendSections([.category, .city, .state, .max_amount])
        
        snapshot.appendItems([.header(Section.category.name), .text(Section.category.name)], toSection: .category)
        snapshot.appendItems([.header(Section.city.name), .text(Section.city.name)], toSection: .city)
        snapshot.appendItems([.header(Section.state.name), .text(Section.state.name)], toSection: .state)
        snapshot.appendItems([.header(Section.max_amount.name), .text(Section.max_amount.name)], toSection: .max_amount)
    
        
        //apply snapshot to data source
        dataSource.apply(snapshot)
        
    }
    
    //configures list appearance
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfig.showsSeparators = false
        listConfig.backgroundColor = .clear
        listConfig.headerMode = .firstItemInSection
        return UICollectionViewCompositionalLayout.list(using: listConfig)
    }
    
   
    
    
    
    
}

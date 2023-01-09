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
        dataSource = DS(collectionView: collectionView) {(collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            
            //reuse cells for performance
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
        }
        
        //create snapshot
        var snapshot = Snapshot()
        
        //append sections
        snapshot.appendSections([0])
        
        //append items to snapshot
        snapshot.appendItems(["This", "is", "a", "test."])
        
        //apply snapshot to data source
        dataSource.apply(snapshot)
        
        //assign data source to collection view
        collectionView.dataSource = dataSource
        
        
        
    }
    
    //configures list appearance
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfig.showsSeparators = false
        listConfig.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfig)
    }
    
    
}

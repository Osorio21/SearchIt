//
//  InputListViewController.swift
//  SearchIt!
//
//  Created by Brian Pinto on 1/8/23.
//

import UIKit

class InputListViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        collectionView.backgroundColor = UIColor(red: 0.0, green: 204.0/255.0, blue: 102.0/255.0, alpha: 1)
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfig = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfig.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfig)
    }
    
    
}

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
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfig = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfig.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfig)
    }
    
}

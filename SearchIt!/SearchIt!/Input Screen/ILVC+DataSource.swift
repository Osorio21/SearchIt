//
//  ILVC+DataSource.swift
//  SearchIt!
//
//
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
        
        //configure background of list cells
        var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfig.backgroundColor = UIColor(named: "TodayListCellBackground")
        cell.backgroundConfiguration = backgroundConfig
        
        //add pencil symbol to left side of field
        var pencilSymbol = pencilSymbol()
        pencilSymbol.tintColor = .black
        cell.accessories = [ .customView(configuration: pencilSymbol), .disclosureIndicator(displayed: .always)]
        
    }
    
    //add pencil button symbol to left of list cell
    //change to switch based on section later
    private func pencilSymbol() -> UICellAccessory.CustomViewConfiguration {
        let pencil = "pencil.circle.fill"
        let symbolConfig = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: pencil, withConfiguration: symbolConfig)
        let pencilButton = UIButton()
        pencilButton.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: pencilButton, placement: .leading(displayed: .always))
    }
    
}

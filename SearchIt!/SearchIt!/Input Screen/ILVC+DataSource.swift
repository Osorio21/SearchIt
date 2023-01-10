//
//  ILVC+DataSource.swift
//  SearchIt!
//
//
//

import UIKit

//houses DataSource behaviors to clean up ILVC file

extension InputListViewController {
    
    typealias DS = UICollectionViewDiffableDataSource<Section,Row>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section,Row>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Row) {
        
        switch (item) {
        case (.header(let title)):
            cell.contentConfiguration = headerConfiguration(for: cell, with: title)
        case (.text(_)):
            cell.contentConfiguration = textFieldConfiguration(for: cell)
        }
        
        cell.tintColor = UIColor(named: "TodayPrimaryTint")
        
        //configure background of list cells
        //var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
        //backgroundConfig.backgroundColor = UIColor(named: "TodayListCellBackground")
        //cell.backgroundConfiguration = backgroundConfig
        
        //add pencil symbol to left side of field
        //var pencilSymbol = pencilSymbol()
        //pencilSymbol.tintColor = .black
        //cell.accessories = [ .customView(configuration: pencilSymbol), .disclosureIndicator(displayed: .always)]
        
    }
    
    //add pencil button symbol to left of list cell
    //change to switch based on section later
    private func pencilSymbol() -> UICellAccessory.CustomViewConfiguration {
        let pencil = "pencil.circle.fill"
        let symbolConfig = UIImage.SymbolConfiguration(textStyle: .body)
        let image = UIImage(systemName: pencil, withConfiguration: symbolConfig)
        let pencilButton = UIButton()
        pencilButton.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: pencilButton, placement: .leading(displayed: .always))
    }
    
}

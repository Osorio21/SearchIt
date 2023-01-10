//
//  TableViewController.swift
//  SearchIt!
//
//  
//

import UIKit

class BusinessViewController: UICollectionViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
        
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        //set background color
        collectionView.backgroundColor = UIColor(red: 0.0, green: 204.0/255.0, blue: 102.0/255.0, alpha: 1)
        
        
        let cellRegistration = UICollectionView.CellRegistration { [self] (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let input = InputValues.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = input.category
            contentConfiguration.secondaryText = input.city + "," + input.state
            contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
            cell.contentConfiguration = contentConfiguration
            
            var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfiguration.backgroundColor = UIColor(named: "TodayListCellBackground")
            cell.backgroundConfiguration = backgroundConfiguration
            
            var buttonSymbol = buttonSymbolConfiguration(for: input)
            buttonSymbol.tintColor = UIColor(named: "TodayListCellDoneButtonTint")
            cell.accessories = [ .customView(configuration: buttonSymbol), .disclosureIndicator(displayed: .always) ]
            
        }
        
        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(InputValues.sampleData.map { $0.category})
        dataSource.apply(snapshot)
        collectionView.dataSource = dataSource
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfig = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfig.showsSeparators = false
        listConfig.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfig)
    }
    
    private func buttonSymbolConfiguration(for input: InputValues) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = "figure.walk"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
        }
}

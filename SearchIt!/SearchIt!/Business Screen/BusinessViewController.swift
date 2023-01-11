//
//  TableViewController.swift
//  SearchIt!
//
//  
//

import UIKit

//confroms to CallDelegate Protocol of class that contains API Call function
class BusinessViewController: UICollectionViewController, CallDelegate {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
        
    var dataSource: DataSource!
    var call: Call?
    var businesses = [Business]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        call = Call()
        call?.delegate = self
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        //set background color
        collectionView.backgroundColor = UIColor(red: 0.0, green: 204.0/255.0, blue: 102.0/255.0, alpha: 1)
        
        //configure list cells
        let cellRegistration = UICollectionView.CellRegistration { [self] (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let input = self.businesses[indexPath.item]//doesn't work
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = input.name
            contentConfiguration.secondaryText = input.address + "  " + input.phone
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
        snapshot.appendItems(self.businesses.map { $0.name})
        dataSource.apply(snapshot)
        
       
    }
    
    //list config
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfig = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfig.showsSeparators = false
        listConfig.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfig)
    }
    
    //add symbols to side of each business row
    private func buttonSymbolConfiguration(for input: Business) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = "figure.walk"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
        }
    
    
    //doesn't function properly
    //obtain decoded JSON and update array of Businesses to then be displayed
    func businessesReturned(_ businesses: [Business]) {
        self.businesses = businesses
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(self.businesses.map { $0.name})
        dataSource.apply(snapshot)
    }
    

}

extension BusinessViewController: APIInformation {
    
    //provides information collected from input screen to use in API call
    func didEnterData(category_text: String, city_text: String, state_text: String, amount_text: String, sort_text: String) {
        var F = Foursquare_API_Constants()
        F.category = category_text
        F.state = state_text
        F.city = city_text
        F.max_amount = Int(amount_text)!
        F.sort_by = sort_text
        call?.fourSquareCall(constant: F)
        
        
    }
    
}



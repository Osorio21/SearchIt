//
//  BusinessDetailViewController.swift
//  SearchIt!
//
//  
//

import UIKit

class BusinessDetailViewController: UICollectionViewController {
    
    //Int instances for section numbers and row instances for items
    private typealias DS = UICollectionViewDiffableDataSource<Int,Row>
    private typealias snapshot = NSDiffableDataSourceSnapshot<Int,Row>
    
    var business: Business
    private var dataSource: DS!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        dataSource = DS(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Row) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        updateSnapshot()
    }
    
    //configuration of content in each cell
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) {
        var contentConfig = cell.defaultContentConfiguration()
        //contentConfig.text = text(for: row)
        contentConfig.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
        contentConfig.image = row.image
        cell.contentConfiguration = contentConfig
        cell.tintColor = UIColor(named: "TodayFutureGradientEnd")
        }
    
    private func updateSnapshot() {
        var snapshot = snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems([.name, .address, .phone, .web], toSection: 0)
        dataSource.apply(snapshot)
    }
    /*
    //returns text for cell depending on row enumeration
    func text(for row: Row) -> String? {
        switch row {
        case .name: return business.name
        case .address: return business.address
        case .phone: return business.phone
        //case .web: return business.website
        }
    }
     */
}

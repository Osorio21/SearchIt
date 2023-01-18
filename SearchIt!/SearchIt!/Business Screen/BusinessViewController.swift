//
//  TableViewController.swift
//  SearchIt!
//
//  
//

import UIKit


class BusinessViewController: UICollectionViewController{
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
        
    var dataSource: DataSource!
    var businesses = [Business]()
    var input: Foursquare_API_Constants?
    var c = Call()
    var F = Foursquare_API_Constants()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let input {
            print(input.city)
            print(input.state)
            print(input.category)
            print(input.max_amount)
            print(input.sort_by)
        }
        
        //fourSquareCall(constant: F)
        
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        //set background color
        collectionView.backgroundColor = UIColor(red: 0.0, green: 204.0/255.0, blue: 102.0/255.0, alpha: 1)
        
        //configure list cells
        let cellRegistration = UICollectionView.CellRegistration {(cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
         
            let input = InputValues.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = input.category
            contentConfiguration.secondaryText = input.city + "," + input.state
            contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
            cell.contentConfiguration = contentConfiguration
            
            var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfiguration.backgroundColor = UIColor(named: "TodayListCellBackground")
            cell.backgroundConfiguration = backgroundConfiguration
            
            /*
            var buttonSymbol = buttonSymbolConfiguration(for: input)
            buttonSymbol.tintColor = UIColor(named: "TodayListCellDoneButtonTint")
            cell.accessories = [ .customView(configuration: buttonSymbol), .disclosureIndicator(displayed: .always) ]
             
             */
            
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
    
    //list config
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfig = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfig.showsSeparators = true
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
    
    func businessesFetched(_ businesses: [Business]){
        self.businesses = businesses
        
    }
    func fourSquareCall(constant: Foursquare_API_Constants) {
        
        //headers
        let headers = [
            "accept": "application/json",
            "Authorization": "fsq3JTL5+KcqJ1NavgKztGZqlH2zm9sYz1Ixk6NR4oKNkns="
        ]
        
        //URL Request
        let request = NSMutableURLRequest(url: NSURL(string: constant.API_URL)! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        
        //set request properties
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        //create task
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            
            //check error and response of dataTask
            if (error != nil) {
                print(error as Any)
                
                //decode data if no errors
            } else {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Businesses.self, from: data!)
                    for x in response.results {
                        self.businesses.append(x)
                    //print(self.businesses.count)
                    }
                }
                
                catch {
                    print("Error parsing data")
                }
                
            }
        }
        
        //start task
        dataTask.resume()
    }
}



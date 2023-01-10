//
//  ILVC+Row.swift
//  SearchIt!
//
// 
//

import Foundation

//manage sections of collectionview in InputListViewController
extension InputListViewController {
    
    //enumeration to manage different sections
    //data sources uses hash values to determine changes in data
    enum Section: Int, Hashable {
        case category //0
        case city //1
        case state //2
        case max_amount //3
        
        
        //name property for heading text
        var name: String {
            switch self {
            case .category:
                return NSLocalizedString("Category", comment: "Product category")
            case .city:
                return NSLocalizedString("City", comment: "City location")
            case .state:
                return NSLocalizedString("State", comment: "State location")
            case .max_amount:
                return NSLocalizedString("Max Number of Results", comment: "Max number of results")
            }
        }
    }
}

//
//  BDVC+Row.swift
//  SearchIt!
//
//  
//

import UIKit

//Row enumeration to apply specific styling to each detail row of selected business

extension BusinessDetailViewController {
    
    //Hashable protocol required by diffable data source that provide lists with data and styling
    enum Row: Hashable {
        case name
        case address
        case phone
        case web
        
        //SF Symbol next to detail row depending on case
        var imageName: String? {
            switch self {
            case .address: return "globe.americas.fill"
            case .phone: return "phone.circle"
            case .web: return "wifi"
            default: return nil
            }
        }
        
        //returns image based on image name
        var image: UIImage? {
            guard let imageName = imageName else { return nil }
            let config = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: config)
        }
        
        //returns text style based on case
        var textStyle: UIFont.TextStyle {
            switch self {
            case .name: return .headline
            default: return .subheadline
            }
        }
    }
}

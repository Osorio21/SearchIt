//
//  ILVC+Row.swift
//  SearchIt!
//
//
//

import UIKit

extension InputListViewController {
    enum Row: Hashable {
        case header(String)
        case text(String)
        
        
        var textStyle: UIFont.TextStyle {
            return .subheadline
            }
        }
    }


//
//  UIContentConfiguration.swift
//  SearchIt!
//
//  
//

//UICC protocol requires types to implement makeContentView and updated methods

import UIKit

extension UIContentConfiguration {
    
    //allows UICC to provide special config depending on state (normal, highlighted, state, etc.)
    func updated(for state: UIConfigurationState) -> Self {
        return self
    }
}

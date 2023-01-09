//
//  UIContentConfiguration.swift
//  SearchIt!
//
//  Created by Brian Pinto on 1/9/23.
//

//UICC protocol requires types to implement makeContentView and updated methods

import UIKit

extension UIContentConfiguration {
    
    //allows UICC to provide special config depending on state (normal, highlighted, state, etc.)
    func updated(for state: UIConfigurationState) -> Self {
        return self
    }
}

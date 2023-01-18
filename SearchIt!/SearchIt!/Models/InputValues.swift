//
//  InputValues.swift
//  SearchIt!
//
//  
//

import Foundation

//sample struct for testing app functionality

struct InputValues {
    var category: String
    var city: String
    var state: String
    var max_amount: Int
    var sort_by: String
}

// not compiled on app release build; solely for debugging test data
#if DEBUG
extension InputValues {
    static var sampleData = [InputValues(category: "Pizza", city: "Seattle", state: "WA", max_amount: 0, sort_by: "a"), InputValues(category: "Hamburger", city: "Tacoma", state: "WA", max_amount: 0, sort_by: "a")]
        
}
#endif

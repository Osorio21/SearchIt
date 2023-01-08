//
//  API_Constants.swift
//  SearchIt!
//
//  Created by Brian Pinto on 1/7/23.
//

import Foundation


//struct that contains strings properties used in creation of URL for Foursquare API Call
struct Foursquare_API_Constants {
    
    static let API_Key = "fsq3JTL5+KcqJ1NavgKztGZqlH2zm9sYz1Ixk6NR4oKNkns="
    var city: String
    var state: String
    var product_category: String
    var API_URL: String
    init(){
        city = "Albany"
        state = "GA"
        product_category = "pizza"
        API_URL = """
https://api.foursquare.com/v3/places/search?query=\(product_category)&fields=name%2Clocation%2Ctel%2Cwebsite%2Cfsq_id%2Cdescription&near=\(city)%2C%20\(state)&limit=1
"""
    }
}







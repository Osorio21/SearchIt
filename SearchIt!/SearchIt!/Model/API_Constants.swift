//
//  API_Constants.swift
//  SearchIt!
//
//  
//

import Foundation


//struct that contains strings properties used in creation of URL for Foursquare API Call
struct Foursquare_API_Constants {
    
    static let API_Key = "fsq3JTL5+KcqJ1NavgKztGZqlH2zm9sYz1Ixk6NR4oKNkns="
    var city: String
    var state: String
    var category: String
    var API_URL: String
    var max_amount: Int
    init(){
        city = "San Francisco"
        state = "CA"
        category = "pizza"
        max_amount = 1
        API_URL = """
https://api.foursquare.com/v3/places/search?query=\(category)&fields=name%2Clocation%2Ctel%2Cwebsite%2Cfsq_id%2Cdescription%2Ctips&near=\(city)%2C%20\(state)&limit=\(max_amount)
"""
    }
}







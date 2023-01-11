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
    static var Business_ID = "BusinessCell"
    var city: String
    var state: String
    var category: String
    var API_URL: String
    var max_amount: Int
    var sort_by: String
    init(){
        city = "Seattle"
        state = "WA"
        category = "pizza"
        max_amount = 2
        sort_by = "RELEVANCE"
        API_URL = """
https://api.foursquare.com/v3/places/search?query=\(category)&fields=name%2Clocation%2Ctel%2Cwebsite%2Cfsq_id%2Cdescription&near=\(city)%2C\(state)&sort=\(sort_by)&limit=\(max_amount)
"""
    }
}







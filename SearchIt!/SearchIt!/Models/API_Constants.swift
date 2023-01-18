//
//  API_Constants.swift
//  SearchIt!
//
//  
//

import Foundation


//struct that contains strings properties used in creation of URL for Foursquare API Call
struct Foursquare_API_Constants {
    
    //declare values in URL
    static let API_Key = "fsq3JTL5+KcqJ1NavgKztGZqlH2zm9sYz1Ixk6NR4oKNkns="
    var city: String
    var state: String
    var category: String
    var API_URL: String
    var max_amount: String
    var sort_by: String
    
    //default values for intializer
    init(_ city: String = "Seattle", _ state: String = "WA", _ category: String = "pizza", _ max_amount: String = "2", _ sort_by: String = "RELEVANCE"){
        
        self.city = city
        self.state = state
        self.category = category
        self.max_amount = max_amount
        self.sort_by = sort_by
        
        self.API_URL = """
https://api.foursquare.com/v3/places/search?query=\(self.category)&fields=name%2Clocation%2Ctel%2Cwebsite%2Cfsq_id%2Ctips%2Cdescription%2Cgeocodes&near=\(self.city)%2C\(self.state)&sort=\(self.sort_by)&limit=\(self.max_amount)
"""
    }
}

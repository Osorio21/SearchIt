//
//  Businesses.swift
//  SearchIt!
//
//  
//

import Foundation

//additional struct to parse outer element of JSON
struct Businesses: Decodable {
    
    var results: [Business]?
    
    enum CodingKeys: String, CodingKey {
        
        case results
    }
    
    //decode into array of Business objects
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([Business].self, forKey: .results)
        
    }
}

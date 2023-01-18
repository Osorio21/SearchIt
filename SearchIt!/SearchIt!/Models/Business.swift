//
//  Business.swift
//  SearchIt!
//
//  
//

import Foundation


//Business object that will contain specific properties
struct Business: Decodable{
    
    let name: String
    let address: String
    let id: String
    var phone: String? = ""
    var website: String? = ""
    var description: String? = ""
    let latitude: Double
    let longitude: Double
    let tips: [Tip]?
    
    
    //specify keys
    enum CodingKeys: String, CodingKey{
        
        case location
        case name
        case address = "formatted_address"
        case phone = "tel"
        case website
        case id = "fsq_id"
        case description
        case geocodes
        case main
        case latitude
        case longitude
        case tips
        
    }
    
    init (from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        //Parse name, phone, website, description and fsq_id
        self.name = try values.decode(String.self, forKey: .name)
        self.phone = try? values.decode(String.self, forKey: .phone)
        self.website = try? values.decode(String.self, forKey: .website)
        self.id = try values.decode(String.self, forKey: .id)
        self.description = try? values.decode(String.self, forKey: .description)
        self.tips = try? values.decode([Tip].self, forKey: .tips)
        
        
        //Parse location data
        let locationContainer = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        self.address = try locationContainer.decode(String.self, forKey: .address)
        
        //Parse latitude and longitude
        let geocodesContainer = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .geocodes)
        let mainContainer = try geocodesContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .main)
        self.latitude = try mainContainer.decode(Double.self, forKey: .latitude)
        self.longitude = try mainContainer.decode(Double.self, forKey: .longitude)
    }
    
    struct Tip: Decodable {
        let text: String
        
        enum CodingKeys: String, CodingKey {
            case text
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.text = try values.decode(String.self, forKey: .text)
        }
    }
}

//Test JSON

/*
 {
   "results": [
     {

       "description": "America’s favorite all-day, everyday stop for coffee, espresso, breakfast sandwiches and donuts. Order your Dunkin’ faves via the drive-thru or order ahead of time with the Dunkin’ mobile app for a fast grab and go experience.",
       "location": {
         "address": "311 W Oglethorpe Blvd",
         "census_block": "130950114002063",
         "country": "US",
         "cross_street": "",
         "dma": "Albany, Ga",
         "formatted_address": "311 W Oglethorpe Blvd, Albany, GA 31701",
         "locality": "Albany",
         "neighborhood": [
           "Gloriana"
         ],
         "postcode": "31701",
         "region": "GA"
       },
       "name": "Dunkin'",
       "tel": "(229) 496-1150",
       "website": "http://www.dunkindonuts.com"

       "name": "Dunkin'"

     }
   ],
   "context": {
     "geo_bounds": {
       "circle": {
         "center": {
           "latitude": 31.57851,
           "longitude": -84.15574
         },
         "radius": 8579
       }
     }
   }
 }
 */

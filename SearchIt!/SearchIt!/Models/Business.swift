//
//  Business.swift
//  SearchIt!
//
//  
//

import Foundation

//Decodable objects with Coding key enumerations that will house specified data from decoded JSON

//Business object that will contain specific properties for presentation in future views
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

    //specify keys for decoding
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
        
        //Parse name, phone, website, description, fsq_id, and tips
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
    
    //Tip object that mimics tip object structure in JSON
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

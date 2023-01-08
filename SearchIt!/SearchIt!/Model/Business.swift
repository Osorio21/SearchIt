//
//  Business.swift
//  SearchIt!
//
//  Created by Brian Pinto on 1/7/23.
//

import Foundation

//Business object that will contain specific properties
struct Business: Decodable {
    
    var name: String
    let address: String
    //let distance: Double
    let phone: String
    let website: String
    let description: String
    
    //specify keys
    enum CodingKeys: String, CodingKey {
        
        case location
        case name
        case address = "formatted_address"
        //case distance
        case phone = "tel"
        case website
        case description
    }
    
    init (from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        //Parse name, phone, website, and description
        self.name = try values.decode(String.self, forKey: .name)
        self.phone = try values.decode(String.self, forKey: .phone)
        self.website = try values.decode(String.self, forKey: .website)
        self.description = try values.decode(String.self, forKey: .description)
        
        //Parse location data
        let locationContainer = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        
        self.address = try locationContainer.decode(String.self, forKey: .address)
        
    }
  
}

//send request to FourSquare Places API
func fourSquareCall() {
    
    //headers
    let headers = [
      "accept": "application/json",
      "Authorization": "fsq3JTL5+KcqJ1NavgKztGZqlH2zm9sYz1Ixk6NR4oKNkns="
    ]
    
    //URL Request
    let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/search?query=coffee&fields=name&near=Albany%2CGA&sort=RELEVANCE&limit=1")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
    
    //set request properties
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    //create task
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        
      //check error and response of dataTask
      if (error != nil) {
        print(error as Any)
      } else {
          let httpResponse = response as? HTTPURLResponse
          print(httpResponse!)
        }
    })

    //start task
    dataTask.resume()
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

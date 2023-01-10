//
//  Business.swift
//  SearchIt!
//
//  
//

import Foundation

var F = Foursquare_API_Constants()

//Business object that will contain specific properties
struct Business: Decodable, Identifiable {
    
    let name: String
    let address: String
    let id: String
    let phone: String
    let website: String
    let description: String
    var tips: [String]?
    
    //specify keys
    enum CodingKeys: String, CodingKey {
        
        case location
        case name
        case address = "formatted_address"
        case phone = "tel"
        case website
        case description
        case tips
        case id = "fsq_id"
    }
    
    init (from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        //Parse name, phone, website, description, tips, and fsq_id
        self.name = try! values.decode(String.self, forKey: .name)
        self.phone = try! values.decode(String.self, forKey: .phone)
        self.website = try! values.decode(String.self, forKey: .website)
        self.description = try! values.decode(String.self, forKey: .description)
        self.tips = try? values.decode(Array.self, forKey: .tips)
        self.id = try! values.decode(String.self, forKey: .id)
        
        //Parse location data
        let locationContainer = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        
        self.address = try locationContainer.decode(String.self, forKey: .address)
        
    }
  
}

//send request to FourSquare Places API
//decode retrieved JSON
func fourSquareCall() {
    
    //headers
    let headers = [
      "accept": "application/json",
      "Authorization": "fsq3JTL5+KcqJ1NavgKztGZqlH2zm9sYz1Ixk6NR4oKNkns="
    ]
    
    //URL Request
    let request = NSMutableURLRequest(url: NSURL(string: F.API_URL)! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
    
    //set request properties
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    //create task
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
        
      //check error and response of dataTask
      if (error != nil) {
        print(error as Any)
      
      //decode data if no errors with error handling
      } else {
          do {
              
              let decoder = JSONDecoder()
              let response = try decoder.decode(Businesses.self, from: data!)
              
              
          }
          catch {
              print("Error parsing data")
              
          }
       
          
          
        }
    }

    //start task
    dataTask.resume()
}

//extend functionality of array
//Given an array of Business objects, returns a Business object based on specified id
extension Array where Element == Business {
    
    func businessIndex(with id: Business.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id}) else {
            fatalError()
        }
        return index
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

//
//  Business.swift
//  SearchIt!
//
//  Created by Brian Pinto on 1/7/23.
//

import Foundation

struct Business: Decodable {
    var name: String
    let address: String //formatted address
    let distance: Double
    let phone: String //tel
    let website: String
    let description: String
}

//test case


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

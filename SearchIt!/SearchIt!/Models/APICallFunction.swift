//
//  APICallFunction.swift
//  SearchIt!
//
//  Created by Brian Pinto on 1/10/23.
//

import Foundation

//send request to FourSquare Places API
//decode retrieved JSON
//set protocol
protocol CallDelegate {
    func businessesReturned(_ businesses: [Business])
}

class Call{
    
    var delegate: CallDelegate?
    
    
    func fourSquareCall(constant: Foursquare_API_Constants) {
        
        //headers
        let headers = [
            "accept": "application/json",
            "Authorization": "fsq3JTL5+KcqJ1NavgKztGZqlH2zm9sYz1Ixk6NR4oKNkns="
        ]
        
        //URL Request
        let request = NSMutableURLRequest(url: NSURL(string: constant.API_URL)! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        
        //set request properties
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        //create task
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { [self] (data, response, error) -> Void in
            
            //check error and response of dataTask
            if (error != nil) {
                print(error as Any)
                
                //decode data if no errors with error handling
            } else {
                do {
                    
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Businesses.self, from: data!)
                    
                    delegate?.businessesReturned(response.results!)
                    
                    
                }
                catch {
                    print("Error parsing data")
                    
                }
                
            }
        }
        
        //start task
        dataTask.resume()
        
    }
}



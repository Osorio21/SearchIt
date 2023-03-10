//
//  APICallFunction.swift
//  SearchIt!
//
//
//

import Foundation

//send request to FourSquare Places API based on URL property in Foursquare_API_Constants
//decode retrieved JSON as Businesses object which is an array of Business objects
//function moved to BusinessTableViewController
//this file is for reference

//declare protocol
protocol APICALL {
    func fetchBusinesses(_ businesses: [Business])
}

class Call {
    
    //delegate property
    var delegate: APICALL?
    
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
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            
            //check error and response of dataTask
            if (error != nil) {
                print(error as Any)
                
            //decode data if no errors 
            } else {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Businesses.self, from: data!)
                    
                    //call delegate method
                    Dispatch.DispatchQueue.main.async {
                        self.delegate?.fetchBusinesses(response.results)
                    }
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

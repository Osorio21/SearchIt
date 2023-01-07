import Foundation

let headers = [
  "accept": "application/json",
  "Authorization": "fsq3JTL5+KcqJ1NavgKztGZqlH2zm9sYz1Ixk6NR4oKNkns="
]

let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/search?query=coffee&fields=name%2Clocation%2Ctel%2Cwebsite&near=Albany%2CGA&sort=RELEVANCE&limit=5")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "GET"
request.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
  if (error != nil) {
    print(error as Any)
  } else {
    let httpResponse = response as? HTTPURLResponse
      print(data!)
  }
})

dataTask.resume()

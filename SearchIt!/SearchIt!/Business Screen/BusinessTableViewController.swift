//
//  BusinessTableViewController.swift
//  SearchIt!
//
//  
//

import UIKit

class BusinessTableViewController: UITableViewController {
    
    var businesses = [Business]()
    let constant = Foursquare_API_Constants()
    var input: Foursquare_API_Constants?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(red: 0.0, green: 102.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        
        let inputData = input!
        
        //headers
        let headers = [
            "accept": "application/json",
            "Authorization": "fsq3JTL5+KcqJ1NavgKztGZqlH2zm9sYz1Ixk6NR4oKNkns="
        ]
        
        //URL Request
        let request = NSMutableURLRequest(url: NSURL(string: inputData.API_URL)! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        
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
                    self.businesses = response.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.businesses.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let business = businesses[indexPath.row]
        cell.textLabel?.text = business.name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        cell.detailTextLabel?.text = business.address
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.backgroundColor = UIColor(named: "TodayGradientFutureEnd")
        return cell
    }
}

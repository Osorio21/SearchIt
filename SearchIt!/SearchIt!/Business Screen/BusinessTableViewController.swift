//
//  BusinessTableViewController.swift
//  SearchIt!
//
//
//

import UIKit

class BusinessTableViewController: UITableViewController {
    
    //declare business array to hold Business objects after API call/JSON decoding
    var businesses = [Business]()
    
    //declare Foursquare_API_Constants object transferred from InputTextController
    var input: Foursquare_API_Constants?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set background color
        tableView.backgroundColor = UIColor(red: 0.0, green: 102.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        
        //create custom view
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
        
        //create button to transition back one screen
        let rewindItbutton = TransitionButton(frame: CGRect(x: 0, y: 0, width: 250, height: 100), label: "RewindIt!")
        
        //button properties and action
        rewindItbutton.accessibilityLabel = NSLocalizedString("Rewind Button", comment: "Rewind button accessibility label")
        rewindItbutton.addTarget(self, action: #selector(returnScreen(sender:)), for: .touchUpInside)
        rewindItbutton.center.x = view.center.x
        rewindItbutton.center.y = customView.center.y
        
        //add button to custom view and add custom view to footer view of table
        customView.addSubview(rewindItbutton)
        tableView.tableFooterView = customView
        
        //force unrap F_A_C object created in ITC
        let inputData = input!
        
        //API Call and JSON decoding process
        
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
    
    //sets number of table cells to number of business objects generated from API call
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.businesses.count
    }
    
    //sets table cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    //customizes data, text, and color of table cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let business = businesses[indexPath.row]
        cell.textLabel?.text = business.name
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        cell.detailTextLabel?.text = business.address
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 20)
        switch indexPath.row % 4 {
        case 0: cell.backgroundColor = UIColor(named: "TodayGradientFutureEnd")
        case 1: cell.backgroundColor = UIColor(named: "TodayGradientAllEnd")
        case 2: cell.backgroundColor = UIColor(named: "TodayGradientAllBegin")
        case 3: cell.backgroundColor = UIColor(named: "TodayGradientTodayBegin")
        default: break
        }
        
        return cell
    }
    
    //loads BusinessDetailsViewController and transfers Business object data associated with touched cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let businessDVC = storyboard?.instantiateViewController(withIdentifier: "BusinessDetails") as! BusinessDetailsViewController
        businessDVC.business = businesses[indexPath.row]
        present(businessDVC, animated: true, completion: nil)
    }
    
    //dismisses view after RewindIt! button is pressed
    @objc func returnScreen(sender: UIButton) {
        dismiss(animated: true)
    }
}

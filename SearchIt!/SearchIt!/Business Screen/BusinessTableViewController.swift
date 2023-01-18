//
//  BusinessTableViewController.swift
//  SearchIt!
//
//
//

//table view controller that displays a table whose cells contain business names and addresses based on API Call with URL properties provides by the user in the InputTextController
//touching on any cell loads the BusinessDetailsViewController

import UIKit

//conform to APICALL protocl as defined in Call class
class BusinessTableViewController: UITableViewController, APICALL {
    
    //initialize business array to hold Business objects after API call/JSON decoding
    var businesses = [Business]()
    
    //declare Foursquare_API_Constants object transferred from InputTextController
    var input: Foursquare_API_Constants?
    
    //initialize Call class that houses API call function
    var call = Call()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set background color
        tableView.backgroundColor = UIColor(red: 0.0, green: 102.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        
        //create custom view for table footer
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
        
        //create button to transition back one screen
        let rewindItbutton = TransitionButton(frame: CGRect(x: 0, y: 0, width: 250, height: 100), label: "RewindIt!")
        
        //button properties and target action
        rewindItbutton.accessibilityLabel = NSLocalizedString("Rewind Button", comment: "Rewind button accessibility label")
        rewindItbutton.addTarget(self, action: #selector(returnScreen(sender:)), for: .touchUpInside)
        rewindItbutton.center.x = view.center.x
        rewindItbutton.center.y = customView.center.y
        
        //add button to custom view and add custom view to footer view of table
        customView.addSubview(rewindItbutton)
        tableView.tableFooterView = customView
        
        //force unrap F_A_C object with URL properties created in InputTextController 
        let inputData = input!
        
        //set self as delegate to Call object
        call.delegate = self
        
        //API Call and JSON decoding process
        call.fourSquareCall(constant: inputData)
    }
    
    //sets results of API call and JSON decoding as already defined businesses variable
    //reloads table data
    func fetchBusinesses(_ businesses: [Business]) {
        self.businesses = businesses
        self.tableView.reloadData()
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

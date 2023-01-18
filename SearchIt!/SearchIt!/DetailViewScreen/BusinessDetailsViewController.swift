//
//  BusinessDetailsViewController.swift
//  SearchIt!
//
//  
//

//view controller that presents a table with useful information about a business selected in the previous screen
//users can choose to map the location by pressing the "MapIt!" button

import UIKit

class BusinessDetailsViewController: UITableViewController {
    
    //declare Business object transferred from BusinessTableViewController
    var business: Business?
    
    //array of table header titles
    let headerTitles = ["Name:", "Description:", "Address:", "Phone:", "Website:", "Tips:"]
    
    //create back button and map button
    let rewindItbutton = TransitionButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50), label: "RewindIt!")
    let mapItbutton = TransitionButton(frame: CGRect(x: 0, y: 0, width: 250, height: 100), label: "MapIt!")
    
    //create custom views
    let footerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set background color
        tableView.backgroundColor = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 1, alpha: 1.0)
        
        //back button properties and action
        rewindItbutton.accessibilityLabel = NSLocalizedString("Rewind Button", comment: "Rewind button accessibility label")
        rewindItbutton.addTarget(self, action: #selector(returnScreen(sender:)), for: .touchUpInside)
        rewindItbutton.center.x = view.center.x
        rewindItbutton.center.y = headerView.center.y
        
        //map button properties
        mapItbutton.accessibilityLabel = NSLocalizedString("Map Button", comment: "Map button accessibility label")
        mapItbutton.addTarget(self, action: #selector(mapBusiness(sender:)), for: .touchUpInside)
        mapItbutton.center.x = view.center.x
        mapItbutton.center.y = footerView.center.y
        
        //add buttons to views and add views to header/footer views of table
        headerView.addSubview(rewindItbutton)
        footerView.addSubview(mapItbutton)
        tableView.tableFooterView = footerView
        tableView.tableHeaderView = headerView
    }
    
    //set cell configuration based on section
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DCell", for: indexPath)
        
        //unwrap Business object from BusinessTableViewController
        let businessData = business!
        
        //array of String properties in Business object
        let businessArray = [businessData.name, businessData.description, businessData.address, businessData.phone, businessData.website]
        
        //set cell content based on section
        switch indexPath.section {
        case 0...4:
            cell.textLabel?.text = businessArray[indexPath.section] ?? "No info found."
            
        //tips section
        default:
            if businessData.tips?.isEmpty == true {
                cell.textLabel?.text = "No info found."
            }
            else {
                cell.textLabel?.text = extractTips(businessData.tips!)
            }
        }
        
        //set cell properties
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.textLabel?.numberOfLines = 0
        cell.backgroundColor = UIColor(named: "TodayGradientTodayBegin")
        return cell
    }
    
    //extract text data from Tip array and convert it to a single text string
    private func extractTips(_ tips: [Business.Tip]) -> String {
        var tip = ""
        var counter = 1
        for item in tips {
            tip = tip + "\(counter)" + ".  " + item.text + "  "
            counter += 1
        }
        return tip
    }
    
    //dismisses view after RewindIt! button is pressed
    @objc func returnScreen(sender: UIButton) {
        dismiss(animated: true)
    }
    
    //presents MapViewController after MapIt! button is pressed
    @objc func mapBusiness(sender: UIButton){
        let mapVC = storyboard?.instantiateViewController(withIdentifier: "MapView") as! MapViewController
        mapVC.business = self.business
        present(mapVC, animated: true, completion: nil)
    }
}

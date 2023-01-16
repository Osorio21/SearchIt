//
//  BusinessDetailsViewController.swift
//  SearchIt!
//
//  
//

import UIKit

class BusinessDetailsViewController: UITableViewController {
    
    //declare Business object transferred from BusinessTableViewController
    var business: Business?
    let headerTitles = ["Name", "Address", "Phone", "Website"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set background color
        tableView.backgroundColor = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 1, alpha: 1.0)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 25))
        label.textColor = UIColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 1)
        label.text = self.headerTitles[section]
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DCell", for: indexPath)
        let businessData = business!
        let businessArray = [businessData.name, businessData.address, businessData.phone, businessData.website]
        cell.textLabel?.text = businessArray[indexPath.section] ?? "No info found."
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.sizeToFit()
        cell.backgroundColor = UIColor(named: "TodayGradientTodayBegin")
        return cell
    }
    
    //sets table cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

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
    
    //array of header titles
    let headerTitles = ["Name:", "Description:", "Address:", "Phone:", "Website:"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set background color
        tableView.backgroundColor = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 1, alpha: 1.0)
        
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
    }
    
    //set number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    //set number of rows per section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //set header text properties
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 25))
        label.textColor = UIColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 1)
        label.text = self.headerTitles[section]
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }
    
    //set cell configuration
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DCell", for: indexPath)
        let businessData = business!
        let businessArray = [businessData.name, businessData.description, businessData.address, businessData.phone, businessData.website]
        
        //set cell content and properties
        cell.textLabel?.text = businessArray[indexPath.section] ?? "No info found."
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.textLabel?.numberOfLines = 0
        //cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        //cell.sizeToFit()
        cell.backgroundColor = UIColor(named: "TodayGradientTodayBegin")
        return cell
    }
    
    //sets table cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    //dismisses view after RewindIt! button is pressed
    @objc func returnScreen(sender: UIButton) {
        dismiss(animated: true)
    }
}

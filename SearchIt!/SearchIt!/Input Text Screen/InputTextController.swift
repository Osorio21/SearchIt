//
//  InputTextController.swift
//  SearchIt!
//
//  
//

import UIKit

//protocol for sending input info to API Call Function
protocol APIInformation {
    func didEnterData(category_text: String, city_text: String, state_text: String, amount_text: String, sort_text: String) 
}

class InputTextController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var APIDelegate: APIInformation?
    
    //text labels for titles
    let cat_Title = UILabel()
    let loc_Title = UILabel()
    let num_Title = UILabel()
    let sort_Title = UILabel()
    
    let pickerArray = ["RELEVANCE", "DISTANCE", "POPULARITY", "RATING"]
    
    
    //initialize gradient class
    let backColors = Colors()
    
    //input text fields
    let cat_TextField = UITextField(frame: CGRect(x: 10, y: 75, width: 350, height: 50))
    let loc_TextField = UITextField(frame: CGRect(x: 10, y: 200, width: 350, height: 50))
    let num_TextField = UITextField(frame: CGRect(x: 10, y: 330, width: 350, height: 50))
    let sort_TextField = UITextField(frame: CGRect(x: 10, y: 455, width: 350, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //properties for category text
        cat_Title.frame = CGRect(x: 10, y: 0, width: 100, height: 100)
        cat_Title.text = "Category:"
        cat_Title.font = UIFont(name: "Gill Sans", size: 20)
        cat_Title.font = UIFont.boldSystemFont(ofSize: cat_Title.font.pointSize)
        cat_Title.textAlignment = .center
        self.view.addSubview(cat_Title)
        
        //properties for category text field
        cat_TextField.placeholder = "Enter product category..."
        cat_TextField.borderStyle = .roundedRect
        cat_TextField.accessibilityLabel = NSLocalizedString("Enter category", comment: "Category text field")
        view.addSubview(cat_TextField)
        
        //properties for location text
        loc_Title.frame = CGRect(x: 10, y: 125, width: 100, height: 100)
        loc_Title.text = "City,State:"
        loc_Title.font = UIFont(name: "Gill Sans", size: 20)
        loc_Title.font = UIFont.boldSystemFont(ofSize: cat_Title.font.pointSize)
        loc_Title.textAlignment = .center
        self.view.addSubview(loc_Title)
        
        //properties for location text field
        loc_TextField.placeholder = "Enter City,State..."
        loc_TextField.borderStyle = .roundedRect
        loc_TextField.accessibilityLabel = NSLocalizedString("Enter location", comment: "Location text field")
        view.addSubview(loc_TextField)
        
        //properties for number of results text
        num_Title.frame = CGRect(x: 0, y: 250, width: 180, height: 100)
        num_Title.text = "Max # of Results:"
        num_Title.font = UIFont(name: "Gill Sans", size: 20)
        num_Title.font = UIFont.boldSystemFont(ofSize: cat_Title.font.pointSize)
        num_Title.textAlignment = .center
        self.view.addSubview(num_Title)
        
        //properties for number of results text field
        num_TextField.placeholder = "Enter max number of results..."
        num_TextField.borderStyle = .roundedRect
        num_TextField.accessibilityLabel = NSLocalizedString("Enter number of results", comment: "Number of results text field")
        view.addSubview(num_TextField)
        
        //properties for sort by title
        sort_Title.frame = CGRect(x: 0, y: 375, width: 100, height: 100)
        sort_Title.text = "Sort by:"
        sort_Title.font = UIFont(name: "Gill Sans", size: 20)
        sort_Title.font = UIFont.boldSystemFont(ofSize: cat_Title.font.pointSize)
        sort_Title.textAlignment = .center
        self.view.addSubview(sort_Title)
        
        //properties for sort by text field
        sort_TextField.placeholder = "Sort by..."
        sort_TextField.borderStyle = .roundedRect
        sort_TextField.accessibilityLabel = NSLocalizedString("Enter sorting criteria", comment: "Sorting picker text field")
        view.addSubview(sort_TextField)
       
        //picker initialization
        let picker = UIPickerView()
        picker.sizeToFit()
        picker.delegate = self
        picker.dataSource = self
        
        sort_TextField.inputView = picker
        
        
        //create button for transition to business detail view screen
        let inputItbutton = UIButton(frame: CGRect(x: 0, y: 650, width: 250, height: 100))
        inputItbutton.setTitle("InputIt!", for: .normal)
        inputItbutton.center.x = self.view.center.x
        inputItbutton.titleLabel?.font = UIFont(name: "Gill Sans", size: 40)
        inputItbutton.backgroundColor = UIColor.systemGray
        inputItbutton.addTarget(self, action: #selector(inputData(sender:)), for: .touchUpInside)
        inputItbutton.accessibilityLabel = NSLocalizedString("Input Data Button", comment: "Input button accessibility label")
        self.view.addSubview(inputItbutton)
        
        
    }
    
    //set background
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        background_refresh()
    }
    
    //adjust frame of background to transition with device orientation
    override func viewDidLayoutSubviews() {
        backColors.cgl.frame = self.view.bounds
    }
    
    //apply background colors to view
    func background_refresh() {
        view.backgroundColor = UIColor.clear
        let backgroundLayer = backColors.cgl
        backColors.cgl.colors = [CGColor(red: 204.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0),CGColor(red: 255.0/255.0, green: 128.0/255.0, blue: 0.0/255.0, alpha: 1.0)]
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
      }
    
    //selector function for button
    //send data to Business Detail View Controller for API Call
    @objc func inputData(sender: UIButton){
        let cText = cat_TextField.text!
        let lsText = loc_TextField.text!
        let i = lsText.firstIndex(of: ",")
        var range = lsText[..<i!]
        let cityText = String(range)
        let comma_break = lsText.index(i!, offsetBy: 1)
        range = lsText[comma_break...]
        let stateText = String(range)
        let nText = num_TextField.text!
        let sText = sort_TextField.text!
        APIDelegate?.didEnterData(category_text: cText, city_text: cityText, state_text: stateText, amount_text: nText, sort_text: sText)
        let businessVC = storyboard?.instantiateViewController(withIdentifier: "BusinessView") as! BusinessViewController
        present(businessVC, animated: true, completion: nil)
        
    }
    
    //picker properties
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sort_TextField.text = pickerArray[row]
        self.view.endEditing(true)
    }
    
    
    
}

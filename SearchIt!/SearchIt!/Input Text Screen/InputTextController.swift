//
//  InputTextController.swift
//  SearchIt!
//
//  
//

import UIKit

class InputTextController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let cat_Title = UILabel()
    let loc_Title = UILabel()
    let num_Title = UILabel()
    let sort_Title = UILabel()
    
    let pickerArray = ["RELEVANCE", "DISTANCE", "POPULARITY", "RATING"]
    
    var sort_TextField: UITextField!
    
    
    
    //initialize gradient class
    let backColors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //properties for category text
        cat_Title.frame = CGRect(x: 10, y: 0, width: 100, height: 100)
        cat_Title.text = "Category:"
        cat_Title.font = UIFont(name: "Gill Sans", size: 20)
        cat_Title.font = UIFont.boldSystemFont(ofSize: cat_Title.font.pointSize)
        cat_Title.textAlignment = .center
        self.view.addSubview(cat_Title)
        
        let cat_TextField = UITextField(frame: CGRect(x: 10, y: 75, width: 350, height: 50))
        cat_TextField.placeholder = "Enter product category..."
        cat_TextField.borderStyle = .roundedRect
        cat_TextField.accessibilityLabel = NSLocalizedString("Enter category", comment: "Category text field")
        view.addSubview(cat_TextField)
        
        //properties for location button
        loc_Title.frame = CGRect(x: 10, y: 125, width: 100, height: 100)
        loc_Title.text = "City,State:"
        loc_Title.font = UIFont(name: "Gill Sans", size: 20)
        loc_Title.font = UIFont.boldSystemFont(ofSize: cat_Title.font.pointSize)
        loc_Title.textAlignment = .center
        self.view.addSubview(loc_Title)
        
        let loc_TextField = UITextField(frame: CGRect(x: 10, y: 200, width: 350, height: 50))
        loc_TextField.placeholder = "Enter City,State..."
        loc_TextField.borderStyle = .roundedRect
        loc_TextField.accessibilityLabel = NSLocalizedString("Enter location", comment: "Location text field")
        view.addSubview(loc_TextField)
        
        //properties for number of results button
        num_Title.frame = CGRect(x: 0, y: 250, width: 180, height: 100)
        num_Title.text = "Max # of Results:"
        num_Title.font = UIFont(name: "Gill Sans", size: 20)
        num_Title.font = UIFont.boldSystemFont(ofSize: cat_Title.font.pointSize)
        num_Title.textAlignment = .center
        self.view.addSubview(num_Title)
        
        let num_TextField = UITextField(frame: CGRect(x: 10, y: 330, width: 350, height: 50))
        num_TextField.placeholder = "Enter max number of results..."
        num_TextField.borderStyle = .roundedRect
        num_TextField.accessibilityLabel = NSLocalizedString("Enter number of results", comment: "Number of results text field")
        view.addSubview(num_TextField)
        
        //properties for number of results button
        sort_Title.frame = CGRect(x: 0, y: 375, width: 100, height: 100)
        sort_Title.text = "Sort by:"
        sort_Title.font = UIFont(name: "Gill Sans", size: 20)
        sort_Title.font = UIFont.boldSystemFont(ofSize: cat_Title.font.pointSize)
        sort_Title.textAlignment = .center
        self.view.addSubview(sort_Title)
        
        let sort_TextField = UITextField(frame: CGRect(x: 10, y: 455, width: 350, height: 50))
        sort_TextField.placeholder = "Sort by..."
        sort_TextField.borderStyle = .roundedRect
        sort_TextField.accessibilityLabel = NSLocalizedString("Enter sorting criteria", comment: "Sorting picker text field")
        view.addSubview(sort_TextField)
        self.sort_TextField = sort_TextField
        
        let picker = UIPickerView()
        picker.sizeToFit()
        picker.delegate = self
        picker.dataSource = self
        
        sort_TextField.inputView = picker
        
        
        //create button for transition to third screen
        let inputItbutton = UIButton(frame: CGRect(x: 0, y: 650, width: 250, height: 100))
        inputItbutton.setTitle("InputIt!", for: .normal)
        inputItbutton.center.x = self.view.center.x
        inputItbutton.titleLabel?.font = UIFont(name: "Gill Sans", size: 40)
        inputItbutton.backgroundColor = UIColor.systemGray
        inputItbutton.addTarget(self, action: #selector(beginApp(sender:)), for: .touchUpInside)
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
    @objc func beginApp(sender: UIButton){
        let businessVC = storyboard?.instantiateViewController(withIdentifier: "BusinessView") as! BusinessViewController
        present(businessVC, animated: true, completion: nil)
        
    }
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

//
//  InputTextController.swift
//  SearchIt!
//
//  
//

//view controller for input text data screen that contains UILabels, UITextFields, PickerView, UISlider, and background color configurations

import UIKit

class InputTextController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        
    //initialize background color gradient struct
    let background_colors = BackgroundColors()
    
    //creation of category input labels
    let cat_Title = InputLabel(frame: CGRect(x: 10, y: 0, width: 100, height: 100), title: "Category")
    let loc_Title = InputLabel(frame: CGRect(x: 10, y: 125, width: 100, height: 100), title: "City,State")
    let num_Title = InputLabel(frame: CGRect(x: 0, y: 250, width: 180, height: 100), title: "Max # of Results")
    let sort_Title = InputLabel(frame: CGRect(x: 0, y: 425, width: 100, height: 100), title: "Sort by")
    
    //creation of input text fields
    let cat_TextField = InputField(frame: CGRect(x: 10, y: 75, width: 350, height: 50), placeholder: "Enter product category...")
    let loc_TextField = InputField(frame: CGRect(x: 10, y: 200, width: 350, height: 50), placeholder: "Enter City,State...")
    let num_TextField = InputField(frame: CGRect(x: 10, y: 330, width: 350, height: 50), placeholder: "Enter max number of results...")
    let sort_TextField = InputField(frame: CGRect(x: 10, y: 505, width: 350, height: 50), placeholder: "Sort by...")
    
    //create button for transition to business screen
    let inputItbutton = TransitionButton(frame: CGRect(x: 0, y: 600, width: 250, height: 100), label: "InputIt!")
    
    //picker initialization
    let picker = UIPickerView()
    
    //picker choices
    let pickerArray = ["RELEVANCE", "DISTANCE", "POPULARITY", "RATING"]
    
    //slider initialization
    let slider = UISlider(frame: CGRect(x: 10, y: 400, width: 350, height: 50))
    
    //initialize state of slider
    var sliderTouched = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //accessibility labels for text fields
        cat_TextField.accessibilityLabel = NSLocalizedString("Enter category", comment: "Category text field")
        loc_TextField.accessibilityLabel = NSLocalizedString("Enter location", comment: "Location text field")
        num_TextField.accessibilityLabel = NSLocalizedString("Enter number of results", comment: "Number of results text field")
        sort_TextField.accessibilityLabel = NSLocalizedString("Enter sorting criteria", comment: "Sorting picker text field")
       
        //set picker properties
        picker.sizeToFit()
        picker.delegate = self
        picker.dataSource = self
        
        //set input view of picker
        sort_TextField.inputView = picker
        
        //set default value of picker text field
        sort_TextField.text = "RELEVANCE"
        
        //set button properties
        inputItbutton.center.x = self.view.center.x
        inputItbutton.addTarget(self, action: #selector(sendData(sender:)), for: .touchUpInside)
        inputItbutton.accessibilityLabel = NSLocalizedString("Input Data Button", comment: "Input button accessibility label")
        
        //set initial button state to hidden
        setUpButton()
        
        //slider properties
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.value = 1
        slider.thumbTintColor = UIColor(red: 160.0/255.0, green: 160.0/255.0, blue: 160.0/255.0, alpha: 1)
        slider.tintColor = UIColor(red: 76.0/255.0, green: 0, blue: 153.0/255.0, alpha: 1)
        slider.maximumTrackTintColor = UIColor(red: 76.0/255.0, green: 0, blue: 153.0/255.0, alpha: 1)
        slider.addTarget(self, action: #selector(updateValue(sender:)), for: .valueChanged)
        
        //add slider to view
        self.view.addSubview(slider)
        
        //add input text labels to view
        self.view.addSubview(cat_Title)
        self.view.addSubview(loc_Title)
        self.view.addSubview(num_Title)
        self.view.addSubview(sort_Title)
        
        //add input text fields to view
        view.addSubview(cat_TextField)
        view.addSubview(loc_TextField)
        view.addSubview(num_TextField)
        view.addSubview(sort_TextField)
        
        //add button to view
        self.view.addSubview(inputItbutton)
    }
    
    //set background
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        background_refresh()
    }
    
    //adjust frame of background to transition with device orientation
    override func viewDidLayoutSubviews() {
        background_colors.cgl.frame = self.view.bounds
    }
    
    //set color values and apply background colors to view
    private func background_refresh() {
        view.backgroundColor = UIColor.clear
        let backgroundLayer = background_colors.cgl
        background_colors.cgl.colors = [CGColor(red: 204.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0),CGColor(red: 255.0/255.0, green: 128.0/255.0, blue: 0.0/255.0, alpha: 1.0)]
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
      }
    
    //pickerView configuration functions
    
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
    
    //update number of results text field when slider value changes
    @objc func updateValue(sender: UISlider) {
        let currentValue = Int(sender.value)
        num_TextField.text = "\(currentValue)"
    }
    
    //sets up initial condition of button as hidden until all text fields contain content
    private func setUpButton() {
        inputItbutton.isHidden = true
        cat_TextField.addTarget(self, action: #selector(checkField(sender:)), for: .editingChanged)
        loc_TextField.addTarget(self, action: #selector(checkField(sender:)), for: .editingChanged)
        slider.addTarget(self, action: #selector(checkBool(sender:)), for: .allTouchEvents)
    }
    
    //determines if text fields have content
    //unhide button when all conditions are met
    @objc func checkField(sender: UITextField) {
        guard
            let cat = cat_TextField.text, !cat.isEmpty,
            let loc = loc_TextField.text, !loc.isEmpty,
            sliderTouched == true
        else {
            self.inputItbutton.isHidden = true
            return
        }
        self.inputItbutton.isHidden = false
    }
    
    //determines if text fields have content, changes sliderTouched value to true after slider movement
    //unhide button when all conditions are met
    @objc func checkBool(sender: UISlider) {
        sliderTouched = true
        guard
            let cat = cat_TextField.text, !cat.isEmpty,
            let loc = loc_TextField.text, !loc.isEmpty,
            sliderTouched == true
        else {
            self.inputItbutton.isHidden = true
            return
        }
        self.inputItbutton.isHidden = false
    }
    
    //sends input data collected to BusinessViewController for API call
    @objc func sendData(sender: UIButton) {
        let cText = cat_TextField.text!
        let csText = loc_TextField.text
        let result = locationSplit(csText)
        let cityText = result.0
        let stateText = result.1
        let nText = num_TextField.text!
        let sText = sort_TextField.text!
        let businessVC = storyboard?.instantiateViewController(withIdentifier: "BusinessView") as! BusinessViewController
        businessVC.input = Foursquare_API_Constants(cityText, stateText, cText, nText, sText)
        present(businessVC, animated: true, completion: nil)
    }
    
    //split location input into city and state constants
    private func locationSplit(_ location: String?) -> (String,String) {
        let csText = location!
        let city = csText.firstIndex(of: ",")
        var range = csText[..<city!]
        let cityText = String(range)
        let comma_break = csText.index(city!, offsetBy: 1)
        range = csText[comma_break...]
        let stateText = String(range)
        return (cityText, stateText)
    }
}

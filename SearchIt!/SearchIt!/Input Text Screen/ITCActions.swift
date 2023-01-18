//
//  ITCButtonActions.swift
//  SearchIt!
//
//  
//

import UIKit

//extension to InputTextController that provides functions for updating text field linked to slider, for determining button's visibiltiy status based on text in fields and slider movement, and for transitioning to BusinessTableViewController when all conditions are met

extension InputTextController {
    
    //update number of results text field when slider value changes
    @objc func updateValue(sender: UISlider) {
        let currentValue = Int(sender.value)
        num_TextField.text = "\(currentValue)"
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
    
    //determines if text fields have content
    //changes sliderTouched value to true after slider movement
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
    
    //sends input data collected to BusinessTableViewController for API call
    @objc func sendData(sender: UIButton) {
        let cText = cat_TextField.text!
        let csText = loc_TextField.text
        
        //splits city and state text
        let result = locationSplit(csText)
        let cityText = result.0
        let stateText = result.1
        
        let nText = num_TextField.text!
        let sText = sort_TextField.text!
        
        let businessTVC = storyboard?.instantiateViewController(withIdentifier: "BusinessTable") as! BusinessTableViewController
        
        //initalizes and transfers Foursquare_API_Constants object with user input values which modifies URL used in API call
        businessTVC.input = Foursquare_API_Constants(cityText, stateText, cText, nText, sText)
        
        present(businessTVC, animated: true, completion: nil)
    }
}

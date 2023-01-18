//
//  ITCPickerConfig.swift
//  SearchIt!
//
//
//

//extension to InputTextController that provides pickerView configuration functions

import UIKit

extension InputTextController {
    
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
}

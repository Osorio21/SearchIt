//
//  ViewController.swift
//  SearchIt!
//
//
//

//view controller for home screen that contains a simple title and start button with minimal styling

import UIKit

class HomeScreenController: UIViewController {
    
    //initialize custom background color struct
    let background_colors = BackgroundColors()
    
    //creation and properties of app label text
    let appTitle = TitleLabel(frame: CGRect(x: 0, y: 200, width: 250, height: 100), title: "SearchIt!")
    
    //create transition button
    let startItbutton = TransitionButton(frame: CGRect(x: 0, y: 600, width: 250, height: 100), label: "StartIt!")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //center title horixontally
        appTitle.center.x = self.view.center.x
        
        //add title label text to view
        self.view.addSubview(appTitle)
        
        //assign properties to button for transition to second screen
        startItbutton.center.x = self.view.center.x
        startItbutton.accessibilityLabel = NSLocalizedString("Start App Button", comment: "Start button accessibility label")
        startItbutton.addTarget(self, action: #selector(beginApp(sender:)), for: .touchUpInside)
        
        //add button to view
        self.view.addSubview(startItbutton)
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
    
    //apply background colors to view
    private func background_refresh() {
        view.backgroundColor = UIColor.clear
        let backgroundLayer = background_colors.cgl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
      }
    
    //selector function for button
    //transition to InputTextController
    @objc func beginApp(sender: UIButton){
        let inputVC = storyboard?.instantiateViewController(withIdentifier: "InputText") as! InputTextController
        present(inputVC, animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  SearchIt!
//
//
//

import UIKit

//view controller for home screen that contains a simple title and start button

class HomeScreenController: UIViewController {
    
    //initialize custom background color struct
    let background_colors = BackgroundColors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creation and properties of app label text
        let appTitle = TitleLabel(frame: CGRect(x: 0, y: 200, width: 250, height: 100), title: "SearchIt!")
        appTitle.center.x = self.view.center.x
        appTitle.textAlignment = .center
        
        //shadow layer of app label text
        appTitle.layer.shadowColor = CGColor(red: 204.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
        appTitle.layer.shadowRadius = 3
        appTitle.layer.shadowOpacity = 1
        appTitle.layer.shadowOffset = CGSize(width: 4, height: 4)
        appTitle.layer.masksToBounds = false
        
        //add app label text to view
        self.view.addSubview(appTitle)
        
        //create button and assign properties for transition to second screen
        let startItbutton = TransitionButton(frame: CGRect(x: 0, y: 600, width: 250, height: 100), label: "StartIt!")
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
    func background_refresh() {
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

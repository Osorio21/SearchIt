//
//  ViewController.swift
//  SearchIt!
//
//
//

import UIKit

class ViewController: UIViewController {
    
    //creation of application title variable
    let appTitle = UILabel()
    
    //initialize gradient class
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //properties of app title text
        appTitle.frame = CGRect(x: 0, y: 200, width: 250, height: 100)
        appTitle.text = "SearchIt!"
        appTitle.font = UIFont(name: "Gill Sans", size: 60)
        appTitle.center.x = self.view.center.x
        appTitle.textAlignment = .center
        appTitle.accessibilityLabel = NSLocalizedString("Start App", comment: "Start button accessibility label")
        appTitle.layer.shadowColor = CGColor(red: 204.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
        appTitle.layer.shadowRadius = 3
        appTitle.layer.shadowOpacity = 1
        appTitle.layer.shadowOffset = CGSize(width: 4, height: 4)
        appTitle.layer.masksToBounds = false
        
        //add app title text to view
        self.view.addSubview(appTitle)
        
        //create button for transition to second screen
        let startItbutton = UIButton(frame: CGRect(x: 0, y: 600, width: 250, height: 100))
        startItbutton.setTitle("StartIt!", for: .normal)
        startItbutton.center.x = self.view.center.x
        startItbutton.titleLabel?.font = UIFont(name: "Gill Sans", size: 40)
        startItbutton.backgroundColor = UIColor.systemGray
        startItbutton.addTarget(self, action: #selector(beginApp(sender:)), for: .touchUpInside)
        self.view.addSubview(startItbutton)
        
        
    }
    
    //set background
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        background_refresh()
    }
    
    //adjust frame of background to transition with device orientation
    override func viewDidLayoutSubviews() {
        colors.cgl.frame = self.view.bounds
    }
    
    //apply background colors to view
    func background_refresh() {
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.cgl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
      }
    
    //selector function for button
    @objc func beginApp(sender: UIButton){
        let inputVC = storyboard?.instantiateViewController(withIdentifier: "InputScreen") as! InputListViewController
        present(inputVC, animated: true, completion: nil)
        
    }
    
    
    
}
        
    




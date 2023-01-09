//
//  TextFieldContent.swift
//  SearchIt!
//
//  
//

import UIKit

//custom Text Field subclass that presents editable text area


//UIContentVIew protocol requires UIContentconfiguration property
class TextFieldContentView: UIView, UIContentView {
    
    //protocol requires makeContentView() and updated(for:) methods
    //this view renders content and styling defined in configuration
    //config provides values for properties and behaviors to customize views
    struct Configuration: UIContentConfiguration {
        
        //content packaged in text field
        var text: String? = ""
        
        //handler to perform behavior when text field changes
        var onChange: (String)->Void = { _ in }
        
        //returns a UIView that conforms to UIContentView
        func makeContentView() -> UIView & UIContentView {
            return TextFieldContentView(self)
        }
    }
    let textField = UITextField()
    var configuration: UIContentConfiguration {
        didSet {
            //calls configuration fucntion - set text
            configure(configuration: configuration)
        }
    }
    
    //allows view to communicate to layout system size preference based on content
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    //accepts UIContentConfiguration
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        
        //no size view and control layout with constraints
        super.init(frame: .zero)
        
        //pin text field
        //pinned to top of superview - horizontal padding of 20; 0 insets force text field to span entire height
        addPinnedSubview(textField, insets: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        
        
    }
    //UIView subclasses that implement custom init must implement init(coder)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration) {
        
        //cast configuration
        //input must have text property
        guard let configuration = configuration as? Configuration else { return }
        
        //update text field
        textField.text = configuration.text
    }
    
    @objc private func didChange(_ sender: UITextField) {
        guard let configuration = configuration as? TextFieldContentView.Configuration else { return }
        
        //call onChange handler
        configuration.onChange(textField.text ?? "")
    }
}

//extend behavior to return a custom configuration to use with TextFieldContentView
extension UICollectionViewCell {
    func textFieldConfiguration() -> TextFieldContentView.Configuration {
            TextFieldContentView.Configuration()
        }
}



//
//  InputButton.swift
//  SearchIt!
//
//
//

import UIKit

//button to transition to third screen located underneath the list cells

class InputItButtonView: UICollectionReusableView {
    static var elementKind: String { UICollectionView.elementKindSectionFooter }
    
    private let footView = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        footView.layer.masksToBounds = false
    }
    
    private func prepareSubviews() {
        addSubview(footView)
        footView.translatesAutoresizingMaskIntoConstraints = false
                
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        footView.heightAnchor.constraint(equalTo: footView.widthAnchor, multiplier: 1).isActive = true
                
        footView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        footView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
                
        footView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        
        backgroundColor = .clear
        footView.backgroundColor = .red
    }
    
   
    
}

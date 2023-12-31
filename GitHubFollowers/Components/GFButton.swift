//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 12/1/23.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(backgroundColor: UIColor, title: String) {
        // we're using `.zero` here instead of a CGRect frame
        // bc we'll be using auto layout constraints later
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        
        // the second argument is the state of the button; we
        // can choose between "normal", "selected", "highlighted", etc
        self.setTitle(title, for: .normal)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /* --- Helper Methods --- */
    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        
        // add this to make the app conform to dynamic type (when user adjusts phone's
        // Text Size in settings)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        // for handling auto-layout
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

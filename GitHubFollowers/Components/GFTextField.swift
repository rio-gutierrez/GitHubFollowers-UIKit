//
//  GFTextField.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 12/1/23.
//

import UIKit

class GFTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /* --- Helper Methods --- */
    private func configure() {
        
        placeholder = "Enter a username"
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        translatesAutoresizingMaskIntoConstraints = false
        
        // `.label` is white on dark mode and black in light mode
        textColor = .label
        tintColor = .label  // `.tintColor` is the blinking cursor's color
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true // makes long text fit into the box
        minimumFontSize = 12 // sets a lower bound for how much the text can shrink
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no // autocorrection for usernames not a good idea
        returnKeyType = .go
    }
    
}

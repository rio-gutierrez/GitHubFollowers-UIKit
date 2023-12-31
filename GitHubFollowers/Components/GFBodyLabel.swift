//
//  GFBodyLabel.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 12/31/23.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    private func configure() {
        textColor = .secondaryLabel // .secondaryLabel has a greyish tint
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true // shrinks very long text to fit
        minimumScaleFactor = 0.75 // minimum that we allow the text to shrink is 75% of original size
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}

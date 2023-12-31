//
//  GFTitleLabel.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 12/31/23.
//

import UIKit

class GFTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    private func configure() {
        textColor = .label // .label = .white (on black screen) / .black (on white screen)
        adjustsFontSizeToFitWidth = true // shrinks very long text to fit
        minimumScaleFactor = 0.9 // minimum that we allow the text to shrink is 90% of original size
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}

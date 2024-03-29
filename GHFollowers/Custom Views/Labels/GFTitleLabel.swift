//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by Mario Luis on 1/11/24
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
    
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    
    private func configure() {
        textColor								= .label  	// .label = .white (on black screen) / .black (on white screen)
        adjustsFontSizeToFitWidth					= true    	// shrinks very long text to fit
        minimumScaleFactor						= 0.9    	// minimum that we allow the text to shrink is 90% of original size
        lineBreakMode							= .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints	= false
    }
}

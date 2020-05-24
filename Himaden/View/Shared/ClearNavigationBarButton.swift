//
//  ClearNavigationBarButton.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class ClearNavigationBarButton: UIButton {
    
    private let padding: CGFloat = 20
    private let barHeight: CGFloat = 44
    private let btnWidth: CGFloat = 100
    
    enum Position {
        case left
        case right
    }
    
    private lazy var textLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: btnWidth, height: 44))
        label.font      = HMDFont.middle
        label.textColor = HMDColor.black
        label.numberOfLines = 1
        
        return label
    }()
    
    init(position: Position) {
        switch position {
        case .left:
            super.init(frame: CGRect(x: padding, y: 0, width: btnWidth, height: barHeight))
        case .right:
            super.init(frame: CGRect(x: UIScreen.main.bounds.width - btnWidth - padding, y: 0, width: btnWidth, height: barHeight))
            textLabel.textAlignment = .right
        }
        
        self.addSubview(textLabel)
    }
    
    func setText(text: String) {
        self.textLabel.text  = text
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

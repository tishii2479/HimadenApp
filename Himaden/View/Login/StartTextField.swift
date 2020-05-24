//
//  StartTextField.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/06.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class StartTextField: UITextField {
    
    private let placeholderAttributes: [NSAttributedString.Key : Any] = [
        .foregroundColor : HMDColor.lightOrange,
        .font : HMDFont.middle
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = HMDColor.clear
        self.attributedPlaceholder = NSAttributedString(string: "", attributes: placeholderAttributes)
        self.textColor = HMDColor.orange
        self.textAlignment = .center
        self.font = HMDFont.middle
        
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 0, y: 50, width: 240, height: 1)
        layer.strokeColor = HMDColor.orange.cgColor
        layer.lineWidth = 1
        
        let line = UIBezierPath()
        line.move(to: CGPoint(x: 0, y: 0))
        line.addLine(to: CGPoint(x: 240, y: 0))
        
        layer.path = line.cgPath
        self.layer.addSublayer(layer)
    }
    
    func setPlaceHolder(text: String) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: placeholderAttributes)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

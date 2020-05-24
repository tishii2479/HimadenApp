//
//  StartBackButton.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/07.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class StartBackButton: UIButton {

    init() {
        super.init(frame: CGRect(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height / 2 + 220, width: 50, height: 30))
        self.backgroundColor = .clear
        
        let arrowLayer = CAShapeLayer()
        arrowLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        arrowLayer.strokeColor = HMDColor.white.cgColor
        arrowLayer.fillColor = HMDColor.clear.cgColor
        arrowLayer.lineWidth = 4
        
        let arrowLine = UIBezierPath()
        arrowLine.move(to: CGPoint(x: 10, y: 10))
        arrowLine.addLine(to: CGPoint(x: 25, y: 20))
        arrowLine.addLine(to: CGPoint(x: 40, y: 10))
        
        arrowLayer.path = arrowLine.cgPath
        
        self.layer.addSublayer(arrowLayer)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//
//  ProfileButton.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class ProfileButton: UIButton {

    private let btnDiameter: CGFloat = 80
    
    enum Kind: Int {
        case CALL
    }
    
    init(btnType: ProfileButton.Kind) {
        super.init(frame: CGRect(x: Util.getMinXForCentering(width: btnDiameter), y: 300, width: btnDiameter, height: btnDiameter))
        
        self.backgroundColor    = HMDColor.lightGray
        self.layer.borderColor  = HMDColor.lightGray.cgColor
        self.layer.borderWidth  = 1
        self.layer.cornerRadius = btnDiameter / 2
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

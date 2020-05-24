//
//  LoginSelectButton.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class StartRoundedButton: UIButton {
    
    init(frame: CGRect, text: String) {
        super.init(frame: frame)
        self.backgroundColor      = HMDColor.white
        self.setTitle(text, for: .normal)
        self.setTitleColor(HMDColor.orange, for: .normal)
        self.titleLabel?.textAlignment    = .center
        self.layer.cornerRadius   = 25
        self.layer.shadowColor    = HMDColor.black.cgColor
        self.layer.shadowOffset   = CGSize(width: 0, height: 4.0)
        self.layer.shadowRadius   = 25
        self.layer.shadowOpacity  = 0.6
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

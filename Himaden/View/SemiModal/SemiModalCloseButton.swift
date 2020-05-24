//
//  SemiModalCloseButton.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class SemiModalCloseButton: UIButton {
    
    private var padding: CGFloat = 10
    
    private lazy var buttonText: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - padding * 2, height: 50))
        label.textAlignment = .center
        label.font          = HMDFont.big
        label.textColor     = HMDColor.white
        label.text          = "閉じる"
        
        return label
    }()
    
    init(minY: CGFloat) {
        super.init(frame: CGRect(x: padding, y: minY, width: UIScreen.main.bounds.width - padding * 2, height: 50))
        self.backgroundColor        = HMDColor.lightGray
        self.layer.cornerRadius     = 25
        
        self.addSubview(buttonText)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

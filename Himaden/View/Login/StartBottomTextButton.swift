
//
//  StartBottomTextButton.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/03.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class StartBottomTextButton: UIButton {

    init(text: String) {
        super.init(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 80, width: UIScreen.main.bounds.width, height: 20))
        self.backgroundColor = HMDColor.clear
        self.setTitleColor(HMDColor.orange, for: .normal)
        self.setTitle(text, for: .normal)
        self.titleLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

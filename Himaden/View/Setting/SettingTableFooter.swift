
//
//  SettingTableFooter.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/26.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class SettingTableFooter: UIView {

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 10))
        self.backgroundColor        = HMDColor.white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

//
//  SettingTableHeader.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/26.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class SettingTableHeader: UIView {

    private var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 30))
        label.textColor = HMDColor.black
        label.font      = HMDFont.big
        
        return label
    }()
    
    init(title: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        self.backgroundColor = HMDColor.white
        
        titleLabel.text      = title
        
        self.addSubview(titleLabel)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

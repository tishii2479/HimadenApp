//
//  FriendTableHeader.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class FriendTableHeader: UIView {

    private var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 30))
        label.textColor = HMDColor.black
        label.font = HMDFont.little
        label.numberOfLines = 0
        
        return label
    }()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        
        self.backgroundColor = HMDColor.lightGray
        self.addSubview(titleLabel)
    }
    
    func setTitleText(text: String) {
        self.titleLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

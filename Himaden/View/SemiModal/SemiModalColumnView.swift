//
//  SemiModalColumnView.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class SemiModalColumnView: UIView {

    private let columnHeight: CGFloat = 60
    private let paddingX: CGFloat = 20
    private let columnImageWidth: CGFloat = 50
    private let topSafeAreaHeight: CGFloat = 30
    
    private lazy var columnImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: paddingX, y: (columnHeight - columnImageWidth) / 2, width: columnImageWidth, height: columnImageWidth))
        view.backgroundColor        = HMDColor.lightGray
        
        return view
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: paddingX * 2 + columnImageWidth, y: 0, width: UIScreen.main.bounds.width - paddingX * 3 - columnImageWidth, height: columnHeight))
        label.textColor             = HMDColor.black
        label.font                  = HMDFont.big
        
        return label
    }()
    
    init(setting: Setting, itemNumber: Int) {
        super.init(frame: CGRect(x: 0, y: CGFloat(itemNumber) * columnHeight + topSafeAreaHeight, width: UIScreen.main.bounds.width, height: columnHeight))
        self.backgroundColor        = HMDColor.clear
        
        self.textLabel.text         = setting.name
        
        self.addSubview(columnImageView)
        self.addSubview(textLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

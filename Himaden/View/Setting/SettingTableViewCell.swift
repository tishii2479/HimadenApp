//
//  SettingTableViewCell.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/26.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    private let cellHeight: CGFloat = 40
    private let paddingY: CGFloat = 5
    private let paddingX: CGFloat = 15
    private let imageWidth: CGFloat = 30
    
    private lazy var settingImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: paddingX, y: paddingY, width: imageWidth, height: imageWidth))
        view.backgroundColor        = HMDColor.lightGray
        
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: paddingX * 2 + imageWidth, y: 0, width: 200, height: cellHeight))
        label.numberOfLines = 1
        label.font          = HMDFont.middle
        label.textColor     = HMDColor.black
        
        return label
    }()
    
    func setUpComponents(setting: Setting) {
        
        nameLabel.text  = setting.name
        
        self.contentView.addSubview(settingImage)
        self.contentView.addSubview(nameLabel)
        
    }

}

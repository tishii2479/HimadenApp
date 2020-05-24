//
//  SettingTableViewCell.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/26.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    fileprivate let cellHeight: CGFloat = 40
    fileprivate let paddingY: CGFloat = 5
    fileprivate let paddingX: CGFloat = 15
    fileprivate let imageWidth: CGFloat = 30
    
    fileprivate lazy var settingImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: paddingX, y: paddingY, width: imageWidth, height: imageWidth))
        view.backgroundColor        = HMDColor.lightGray
        
        return view
    }()
    
    fileprivate lazy var nameLabel: UILabel = {
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

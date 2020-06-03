//
//  SelectPostRangeTableViewCell.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class SelectPostRangeTableViewCell: UITableViewCell {

    private let cellHeight: CGFloat     = 50
    private let iconDiameter: CGFloat   = 40
    private let paddingX: CGFloat       = 10
    private let paddingY: CGFloat       = 5
    private let addButtonWidth: CGFloat = 90
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: paddingX, y: paddingY, width: iconDiameter, height: iconDiameter))
        view.layer.cornerRadius = iconDiameter / 2
        view.backgroundColor    = HMDColor.lightGray
        
        return view
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: paddingX * 2 + iconDiameter, y: 0, width: UIScreen.main.bounds.width - paddingX * 4 - iconDiameter - addButtonWidth, height: cellHeight))
        label.font      = HMDFont.middle
        label.textColor = HMDColor.black
        
        return label
    }()
    private lazy var addButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - addButtonWidth - paddingX, y: 5, width: addButtonWidth, height: 40))
        button.backgroundColor      = HMDColor.white
        button.layer.borderColor    = HMDColor.lightGray.cgColor
        button.layer.borderWidth    = 1
        button.setTitle("追加する", for: .normal)
        button.titleLabel?.font     = HMDFont.middle
        button.titleLabel?.textColor    = HMDColor.black
        
        return button
    }()
    
    func setUpComponents(friend: Friend, vc: UIViewController) {
        nameLabel.text      = friend.name
        
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(addButton)
    }
    
}

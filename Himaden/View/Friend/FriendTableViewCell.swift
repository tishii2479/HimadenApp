//
//  FriendTableViewCell.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    fileprivate let cellHeight: CGFloat = 60
    fileprivate let iconDiameter: CGFloat = 50
    fileprivate let paddingX: CGFloat = 20
    fileprivate let paddingY: CGFloat = 5
    fileprivate let statusWidth: CGFloat = 100
    
    fileprivate lazy var iconImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: paddingX, y: paddingY, width: iconDiameter, height: iconDiameter))
        view.layer.cornerRadius = iconDiameter / 2
        view.backgroundColor    = HMDColor.lightGray
        
        return view
    }()
    
    fileprivate lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: paddingX * 2 + iconDiameter, y: paddingY * 1.5, width: UIScreen.main.bounds.width - paddingX * 4 - iconDiameter - statusWidth, height: 20))
        label.font      = HMDFont.middle
        label.textColor = HMDColor.black
        
        return label
    }()
    
    fileprivate lazy var detailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: paddingX * 2 + iconDiameter, y: cellHeight / 2 + paddingY, width: UIScreen.main.bounds.width - paddingX * 4 - iconDiameter - statusWidth, height: 20))
        label.font      = HMDFont.tiny
        label.textColor = HMDColor.lightGray
        
        return label
    }()
    
    fileprivate lazy var statusLabel: UserStatusView = UserStatusView(origin: CGPoint(x: UIScreen.main.bounds.width - paddingX - statusWidth, y: paddingY * 2))
    
    func setUpComponents(friend: Friend) {
        nameLabel.text = friend.name
        detailLabel.text = friend.comment
        statusLabel.setStatus(status: friend.status)
        
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(detailLabel)
        self.contentView.addSubview(statusLabel)
    }
}

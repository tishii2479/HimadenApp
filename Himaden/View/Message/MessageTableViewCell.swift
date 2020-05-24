//
//  MessageTableViewCell.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/23.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import SnapKit

class MessageTableViewCell: UITableViewCell {
    
    fileprivate let iconDiameter: CGFloat   = 44
    fileprivate let paddingX: CGFloat       = 20
    fileprivate let paddingY: CGFloat       = 10
    
    fileprivate lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = iconDiameter / 2
        view.backgroundColor    = HMDColor.lightGray
        
        return view
    }()
    
    fileprivate var messageLabel: UILabel = {
        let label = UILabel()
        label.layer.backgroundColor = HMDColor.lightGray.cgColor
        label.textAlignment         = .center
        label.textColor             = HMDColor.black
        label.font                  = HMDFont.little
        label.layer.cornerRadius    = 10
        label.layer.borderColor     = HMDColor.black.cgColor
        label.layer.borderWidth     = 1
        label.numberOfLines         = 0
        label.lineBreakMode         = .byWordWrapping
        
        return label
    }()
    
    fileprivate var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor   = HMDColor.clear
        label.textColor         = HMDColor.black
        label.font              = HMDFont.middle
        
        return label
    }()
    
    fileprivate var timeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor   = HMDColor.clear
        label.textColor         = HMDColor.black
        label.font              = HMDFont.tiny
        
        return label
    }()
    
    func setUpComponents (message: Message) {
        self.backgroundColor = HMDColor.clear
        
        messageLabel.text   = message.text
        nameLabel.text      = message.sender.name
        timeLabel.text      = "4:00"
        
        messageLabel.sizeToFit()
        let messageLabelSize = getMessageLabelSize(frame: messageLabel.frame)
        
        switch(message.senderType) {
        case .get:
            messageLabel.frame = CGRect(x: paddingX * 2 + iconDiameter, y: paddingY * 2 + 20 , width: messageLabelSize.width, height: messageLabelSize.height)
            iconImageView.frame = CGRect(x: paddingX, y: paddingY, width: iconDiameter, height: iconDiameter)
            nameLabel.frame = CGRect(x: paddingX * 2 + iconDiameter, y: paddingY, width: 200, height: 20)
            timeLabel.frame = CGRect(x: messageLabel.frame.maxX - 40, y: paddingY * 3 + 20 + 30, width: 100, height: 14)
            messageLabel.layer.backgroundColor = HMDColor.white.cgColor
        case .send:
            messageLabel.frame = CGRect(x: UIScreen.main.bounds.width - paddingX - messageLabelSize.width, y: paddingY, width: messageLabelSize.width, height: messageLabelSize.height)
            timeLabel.frame = CGRect(x: messageLabel.frame.maxX - 40, y: messageLabel.frame.maxY + paddingY, width: 100, height: 14)
            messageLabel.layer.backgroundColor = HMDColor.lightOrange.cgColor
        }
        
        self.contentView.addSubview(messageLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(timeLabel)
        self.contentView.addSubview(iconImageView)
        
        self.contentView.snp.makeConstraints({ (make) in
            make.bottom.equalTo(timeLabel).offset(0)
        })
    }
    
    func getMessageLabelSize(frame: CGRect) -> CGSize {
        var f = frame
        f.size.width += 20
        f.size.height += 10
        
        return f.size
    }
    
}

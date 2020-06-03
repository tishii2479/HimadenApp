//
//  CallTableViewCell.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class CallTableViewCell: UITableViewCell {

    private let iconDiameter: CGFloat   = 50
    private let cellHeight: CGFloat     = 60
    private let paddingX: CGFloat       = 10
    private let timeLabelWidth: CGFloat = 100
    lazy var iconImage: UIButton = {
        let view = UIButton(frame: CGRect(x: paddingX, y: (cellHeight - iconDiameter) / 2, width: iconDiameter, height: iconDiameter))
        view.backgroundColor    = HMDColor.lightGray
        view.layer.cornerRadius = iconDiameter / 2
        
        return view
    }()
    private lazy var textContentLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: paddingX * 2 + iconDiameter, y: 0, width: UIScreen.main.bounds.width - iconDiameter - timeLabelWidth - paddingX * 4, height: cellHeight))
        label.textColor         = HMDColor.black
        label.font              = HMDFont.middle
        
        return label
    }()
    private lazy var timeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: UIScreen.main.bounds.width - paddingX - timeLabelWidth, y: 0, width: timeLabelWidth, height: cellHeight))
        label.textColor         = HMDColor.gray
        label.font              = HMDFont.little
        label.textAlignment     = .right
        
        return label
    }()
    
    func setUpComponents(call: Call, selfName: String) {
        
        if selfName == call.senderName {
            textContentLabel.text   = call.receiverName + "さんとの通話"
        } else if selfName == call.receiverName {
            textContentLabel.text   = call.senderName + "さんとの通話"
        } else {
            print("[error] Call senderName and receiverName doesnt match to selfName, wrong call is selected to show")
        }
        timeLabel.text              = "1:23:45 4/1"
        
        self.contentView.addSubview(iconImage)
        self.contentView.addSubview(textContentLabel)
        self.contentView.addSubview(timeLabel)
    }

}

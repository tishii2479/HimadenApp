//
//  PostTableViewCell.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/25.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {

    private let iconDiameter: CGFloat   = 50
    private let cellLeftWidth: CGFloat  = 90
    private let paddingX: CGFloat       = 20
    private let paddingY: CGFloat       = 10
    private let labelWidth: CGFloat     = 200
    
    private lazy var header: UILabel = {
        let label = UILabel()
        label.font              = HMDFont.little
        label.textColor         = HMDColor.gray
        label.backgroundColor   = HMDColor.clear
        
        return label
    }()
    
    lazy var iconImage: UIButton = {
        let view = UIButton()
        view.layer.backgroundColor  = HMDColor.lightGray.cgColor
        view.layer.cornerRadius     = iconDiameter / 2
        
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font              = HMDFont.big
        label.textColor         = HMDColor.black
        label.backgroundColor   = HMDColor.clear
        
        return label
    }()
    
    private lazy var textContentLabel: UILabel = {
        let label = UILabel()
        label.font              = HMDFont.middle
        label.textColor         = HMDColor.black
        label.backgroundColor   = HMDColor.clear
        label.numberOfLines     = 0
        
        return label
    }()
    
    private lazy var postImage: UIImageView = {
        let view = UIImageView()
        view.layer.backgroundColor    = HMDColor.lightGray.cgColor
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private lazy var postDateLabel: UILabel = {
        let label = UILabel()
        label.font              = HMDFont.little
        label.textColor         = HMDColor.gray
        label.backgroundColor   = HMDColor.clear
        label.textAlignment     = .right
        label.numberOfLines     = 1
        
        return label
    }()
    
    private var statusView: UserStatusView!
    
    func setUpComponents(post: Post) {
        
        self.backgroundColor = HMDColor.white
        
        nameLabel.text      = post.ownerName
        postDateLabel.text  = "4:00"
        iconImage.frame = CGRect(x: paddingX, y: paddingY, width: iconDiameter, height: iconDiameter)
        nameLabel.frame = CGRect(x: paddingX * 2 + iconDiameter, y: paddingY, width: labelWidth, height: 20)
        textContentLabel.text = post.text
        textContentLabel.sizeToFit()
        textContentLabel.frame = CGRect(x: paddingX * 2 + iconDiameter, y: nameLabel.frame.maxY + paddingY, width: textContentLabel.frame.width, height: textContentLabel.frame.height)
        
        if let image = post.image {
            let imageWidth = UIScreen.main.bounds.width - paddingX * 3 - iconDiameter
            postImage.frame = CGRect(x: paddingX * 2 + iconDiameter, y: textContentLabel.frame.maxY + paddingY * 2, width: imageWidth, height: imageWidth * 9 / 16)
            self.contentView.addSubview(postImage)
            postDateLabel.frame = CGRect(x: UIScreen.main.bounds.width - 60, y: postImage.frame.maxY + 20, width: 40, height: 15)
        } else {
            postDateLabel.frame = CGRect(x: UIScreen.main.bounds.width - 60, y: textContentLabel.frame.maxY + 20, width: 40, height: 15)
        }
        
        statusView = UserStatusView(origin: CGPoint(x: UIScreen.main.bounds.width - 170, y: postDateLabel.frame.minY))
        statusView.setStatus(status: .offline)
        
        self.contentView.addSubview(header)
        self.addSubview(iconImage)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(textContentLabel)
        self.contentView.addSubview(postDateLabel)
        self.contentView.addSubview(statusView)
        self.contentView.snp.makeConstraints({ (make) in
            make.bottom.equalTo(postDateLabel).offset(10)
        })
    }
    
    @objc func tapIcon() {
        print("tapIcon")
    }

}

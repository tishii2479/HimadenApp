//
//  PostInfoView.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/25.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import SnapKit

class PostInfoView: UIView {

    fileprivate let padding: CGFloat            = 20
    fileprivate let iconDiameter: CGFloat       = 60
    fileprivate let callButtonDiameter: CGFloat = 60
    fileprivate let labelWidth: CGFloat         = 200
    fileprivate var vc: UIViewController!
    
    fileprivate lazy var iconImage: UIButton = {
        let view = UIButton(frame: CGRect(x: padding, y: padding, width: iconDiameter, height: iconDiameter))
        view.layer.cornerRadius     = iconDiameter / 2
        view.layer.backgroundColor  = HMDColor.lightGray.cgColor
        view.addTarget(self, action: #selector(self.tapIcon), for: .touchUpInside)
        
        return view
    }()
    fileprivate lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: padding * 2 + iconDiameter, y: padding, width: labelWidth, height: 20))
        label.font          = HMDFont.big
        label.textColor     = HMDColor.black
        
        return label
    }()
    fileprivate lazy var statusView: UserStatusView = UserStatusView(origin: CGPoint(x: padding * 3 + iconDiameter, y: padding * 2 + 20))
    fileprivate lazy var postedDateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: statusView.frame.maxX + padding, y: statusView.frame.minY, width: 100, height: 15))
        label.font          = HMDFont.little
        label.textColor     = HMDColor.gray
        
        return label
    }()
    fileprivate lazy var textContentLabel: UILabel = {
        let label = UILabel()
        label.font          = HMDFont.middle
        label.textColor     = HMDColor.black
        label.numberOfLines = 0
        
        return label
    }()
    fileprivate lazy var postImage: UIImageView = {
        let view = UIImageView()
        view.layer.backgroundColor  = HMDColor.lightGray.cgColor
        view.layer.cornerRadius     = 10
        
        return view
    }()
    fileprivate lazy var callButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor         = HMDColor.lightGray
        btn.layer.cornerRadius      = callButtonDiameter / 2
        
        return btn
    }()
    
    init(post: Post, vc: UIViewController) {
        super.init(frame: CGRect(x: 0, y: AppUtils.statusBarHeight + 44, width: UIScreen.main.bounds.width, height: 0))
        
        self.backgroundColor = HMDColor.white
        self.vc = vc
        
        nameLabel.text     = post.ownerName
        statusView.setStatus(status: .offline)
        postedDateLabel.text = "4:00"
        textContentLabel.text = post.text
        textContentLabel.sizeToFit()
        textContentLabel.frame = CGRect(x: padding + iconDiameter / 2, y: iconImage.frame.maxY + padding, width: textContentLabel.frame.width, height: textContentLabel.frame.height)
        
        if let image = post.image {
            let imageWidth = UIScreen.main.bounds.width - padding * 2
            postImage.frame = CGRect(x: padding, y: textContentLabel.frame.maxY + padding, width: imageWidth, height: imageWidth * 9 / 16)
            callButton.frame = CGRect(x: UIScreen.main.bounds.width - padding * 2 - callButtonDiameter, y: postImage.frame.maxY + padding, width: callButtonDiameter, height: callButtonDiameter)
            self.addSubview(postImage)
        } else {
            callButton.frame = CGRect(x: UIScreen.main.bounds.width - padding * 2 - callButtonDiameter, y: textContentLabel.frame.maxY + padding, width: callButtonDiameter, height: callButtonDiameter)
        }
        
        self.addSubview(iconImage)
        self.addSubview(nameLabel)
        self.addSubview(statusView)
        self.addSubview(postedDateLabel)
        self.addSubview(textContentLabel)
        self.addSubview(callButton)
        
        self.frame.size.height = callButton.frame.maxY + 15
    }
    
    @objc func tapIcon() {
        // 注意！！！
        // これはtabBarControllerがnilになっている時がある
        // tabBarControllerをAppUtilsの静的メンバとして共有するか検討
        let friendVC = FriendDetailedViewController(friend: Account(), tabBarController: self.vc.tabBarController ?? HMDTabBarController())
        let navVC = HMDNavigationController(rootViewController: friendVC)
        navVC.modalPresentationStyle = .fullScreen
        
        self.vc.present(navVC, animated: true, completion: {
            print("Present to FriendDetailedViewController with account: c(Account())")
        })
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

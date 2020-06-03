//
//  ProfileAtCallView.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/23.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit


class ProfileView: UIView {

    private let labelWidth: CGFloat     = 200
    private let marginY: CGFloat        = 20
    private let iconDiameter: CGFloat   = 120
    private var vc: UIViewController!
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: Util.getMinXForCentering(width: iconDiameter), y: marginY, width: iconDiameter, height: iconDiameter))
        view.layer.backgroundColor      = HMDColor.lightGray.cgColor
        view.layer.cornerRadius         = iconDiameter / 2
        
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: Util.getMinXForCentering(width: labelWidth), y: iconImageView.frame.maxY + marginY, width: labelWidth, height: 20))
        label.backgroundColor    = HMDColor.clear
        label.textAlignment      = .center
        label.font               = HMDFont.middle
        label.textColor          = HMDColor.black
        
        return label
    }()

    private lazy var callTimeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: Util.getMinXForCentering(width: labelWidth), y: nameLabel.frame.maxY + marginY / 2, width: labelWidth, height: 20))
        label.backgroundColor   = HMDColor.clear
        label.textAlignment     = .center
        label.font              = HMDFont.little
        label.textColor         = HMDColor.gray
        
        return label
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: Util.getMinXForCentering(width: labelWidth), y: nameLabel.frame.maxY + 5, width: labelWidth, height: 20))
        label.font              = HMDFont.tiny
        label.textColor         = HMDColor.black
        label.backgroundColor   = HMDColor.clear
        label.textAlignment     = .center
        
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: Util.getMinXForCentering(width: labelWidth), y: idLabel.frame.maxY + 5, width: labelWidth, height: 40))
        label.font              = HMDFont.little
        label.textColor         = HMDColor.gray
        label.backgroundColor   = HMDColor.clear
        label.numberOfLines     = 0
        label.textAlignment     = .center
        
        return label
    }()
    private lazy var statusView: UserStatusView = UserStatusView(origin: CGPoint(x: Util.getMinXForCentering(width: 100), y: 260))
    private lazy var settingBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 60, y: commentLabel.frame.minY, width: 40, height: 40))
        btn.backgroundColor     = HMDColor.clear
        btn.layer.borderWidth   = 1
        btn.layer.borderColor   = HMDColor.black.cgColor
        btn.setImage(UIImage(named: "setting")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = HMDColor.gray
        btn.imageEdgeInsets     = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        return btn
    }()
    
    private var speakerBtn          = ProfileAtCallButton(btnType: .SPEAKER)
    private var muteBtn             = ProfileAtCallButton(btnType: .MUTE)
    private var videoBtn            = ProfileAtCallButton(btnType: .VIDEO)
    private var endBtn              = ProfileAtCallButton(btnType: .END)
    private var callBtn             = ProfileButton(btnType: .CALL)
    
    init(frame: CGRect, vc: UIViewController) {
        super.init(frame: frame)
        self.vc = vc
        
        self.backgroundColor = HMDColor.white
        self.addSubview(iconImageView)
        self.addSubview(nameLabel)
        
        if let cvc = vc as? CallingViewController {

            self.addSubview(callTimeLabel)
            self.addSubview(speakerBtn)
            self.addSubview(muteBtn)
            self.addSubview(videoBtn)
            self.addSubview(endBtn)

            endBtn.addTarget(cvc, action: #selector(cvc.tapEndCall), for: .touchUpInside)
            
        } else if let fvc = vc as? FriendDetailedViewController {
            
            self.addSubview(idLabel)
            self.addSubview(commentLabel)
            self.addSubview(statusView)
            self.addSubview(callBtn)
            self.addSubview(settingBtn)
            
            callBtn.addTarget(fvc, action: #selector(fvc.tapCall), for: .touchUpInside)
            settingBtn.addTarget(fvc, action: #selector(fvc.tapSettingBtn), for: .touchUpInside)

        } else if let pvc = vc as? ProfileViewController {
            
            self.addSubview(idLabel)
            self.addSubview(commentLabel)
            self.addSubview(statusView)
            self.addSubview(settingBtn)
            
            settingBtn.addTarget(pvc, action: #selector(pvc.tapSettingBtn), for: .touchUpInside)
            
        } else {
            print("[debug] ViewController not found: \(vc)")
        }
    }
    
    func setAccountInfo(friend: Friend) {
        nameLabel.text = friend.name
        idLabel.text = "id: " + friend.id
        commentLabel.text = friend.comment
        commentLabel.sizeToFit()
        commentLabel.frame.size.width = labelWidth
        statusView.setStatus(status: Status(rawValue: friend.status) ?? .offline)
    }
    
    func setAccountInfoWhenCalling(account: Account) {
        nameLabel.text = account.name
        callTimeLabel.text = "0:00"
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

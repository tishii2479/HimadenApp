//
//  ProfileAtCallButton.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/23.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

fileprivate let btnDiameter: CGFloat    = 80
fileprivate let padding: CGFloat        = 20

class ProfileAtCallButton: UIButton {
    
    enum Kind: Int {
        case SPEAKER
        case MUTE
        case VIDEO
        case END
    }
    
    let imageName: [String] = [
        "speaker",
        "mute",
        "video",
        "cross"
    ]
    
    init(btnType: ProfileAtCallButton.Kind) {
        super.init(frame: CGRect(x: ProfileAtCallButton.calculateMinX(btnType: btnType), y: ProfileAtCallButton.calculateMinY(btnType: btnType), width: btnDiameter, height: btnDiameter))
        self.layer.borderWidth      = 1
        self.layer.borderColor      = HMDColor.black.cgColor
        self.layer.cornerRadius     = btnDiameter / CGFloat(2)
        self.backgroundColor        = HMDColor.white
        
        let image = UIImage(named: imageName[btnType.rawValue])
        self.setImage(image, for: .normal)
        
        if btnType == .END {
            self.imageEdgeInsets    = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        } else {
            self.imageEdgeInsets    = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        }
    }
    
    class func calculateMinX(btnType: ProfileAtCallButton.Kind) -> CGFloat {
        return padding + CGFloat(btnType.rawValue) * (UIScreen.main.bounds.width - padding * 2 - btnDiameter) / 3
    }
    
    class func calculateMinY(btnType: ProfileAtCallButton.Kind) -> CGFloat {
        if btnType == .SPEAKER || btnType == .END {
            return 200
        } else {
            return 250
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

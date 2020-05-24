//
//  UserStatusView.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class UserStatusView: UIView {

    private var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 0, width: 75, height: 15))
        label.textColor     = HMDColor.black
        label.font          = HMDFont.middle
        label.textAlignment = .center
        
        return label
    }()
    
    private var signal: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        view.layer.backgroundColor = HMDColor.black.cgColor
        view.layer.cornerRadius    = 7.5
        
        return view
    }()
    

    init(origin: CGPoint) {
        super.init(frame: CGRect(origin: origin, size: CGSize(width: 100, height: 15)))
        self.backgroundColor = HMDColor.clear
        
        self.addSubview(label)
        self.addSubview(signal)
    }
    
    func setStatus(status: Status) {
        switch status {
        case .online:
            label.text = "オンライン"
            signal.backgroundColor = HMDColor.online
        case .offline:
            label.text = "オフライン"
            signal.backgroundColor = HMDColor.offline
        case .calling:
            label.text = "通話中"
            signal.backgroundColor = HMDColor.online
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

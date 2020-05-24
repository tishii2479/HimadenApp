//
//  ClearNavigationBar.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/26.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class ClearNavigationBar: UIView {

    private let barHeight: CGFloat = 44
    
    private var leftButton: ClearNavigationBarButton = ClearNavigationBarButton(position: .left)
    private var rightButton: ClearNavigationBarButton = ClearNavigationBarButton(position: .right)
    private lazy var centerTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: Util.getMinXForCentering(width: 200), y: 0, width: 200, height: barHeight))
        label.font                  = HMDFont.big
        label.textColor             = HMDColor.black
        label.textAlignment         = .center
        
        return label
    }()
    
    init(vc: UIViewController, leftTitle: String, rightTitle: String, centerTitle: String?) {
        super.init(frame: CGRect(x: 0, y: AppUtils.statusBarHeight, width: UIScreen.main.bounds.width, height: barHeight))
        self.backgroundColor    = HMDColor.clear
        
        leftButton.setText(text: leftTitle)
        rightButton.setText(text: rightTitle)
        centerTitleLabel.text = centerTitle ?? ""
    
        if let cpvc = vc as? CreatePostViewController {
            leftButton.addTarget(cpvc, action: #selector(cpvc.tapLeft), for: .touchUpInside)
            rightButton.addTarget(cpvc, action: #selector(cpvc.tapRight), for: .touchUpInside)
        } else if let srvc = vc as? SelectPostRangeViewController {
            leftButton.addTarget(srvc, action: #selector(srvc.tapLeft), for: .touchUpInside)
            rightButton.addTarget(srvc, action: #selector(srvc.tapRight), for: .touchUpInside)
        } else if let fdvc = vc as? FriendDetailedViewController {
            leftButton.addTarget(fdvc, action: #selector(fdvc.tapLeftBtn), for: .touchUpInside)
        }
        
        self.addSubview(leftButton)
        self.addSubview(centerTitleLabel)
        self.addSubview(rightButton)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

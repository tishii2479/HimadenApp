//
//  ProfileToolBarView.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/25.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class ProfileToolBarView: UISegmentedControl {

    fileprivate let params: [String] = ["投稿", "通話履歴"]
    
    init(origin: CGPoint, vc: UIViewController) {
        super.init(frame: CGRect(origin: origin, size: CGSize(width: UIScreen.main.bounds.width, height: 40)))
        insertSegment(withTitle: "投稿", at: 0, animated: false)
        insertSegment(withTitle: "通話履歴", at: 1, animated: false)
        
        self.backgroundColor        = HMDColor.lightGray
        self.tintColor              = HMDColor.white
        self.layer.borderColor      = HMDColor.lightGray.cgColor
        self.selectedSegmentIndex   = 0
        
        if let pvc = vc as? ProfileViewController {
            self.addTarget(pvc, action: #selector(pvc.segmentChanged(_:)), for: .valueChanged)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//
//  CreatePostButton.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/26.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class CreatePostButton: UIButton {

    fileprivate let btnDiameter: CGFloat = 60
    fileprivate let margin: CGFloat = 20
    
    init(vc: UIViewController) {
        super.init(frame: CGRect(x: UIScreen.main.bounds.width - btnDiameter - margin, y: UIScreen.main.bounds.height - 80 - margin - btnDiameter, width: btnDiameter, height: btnDiameter))
        self.backgroundColor    = HMDColor.orange
        self.layer.cornerRadius = btnDiameter / 2
        
        self.imageEdgeInsets    = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.setImage(UIImage(named: "feather")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.imageView?.tintColor = HMDColor.white
        
        if let bvc = vc as? BulletinBoardViewController {
            self.addTarget(bvc, action: #selector(bvc.tapCreateBtn), for: .touchUpInside)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

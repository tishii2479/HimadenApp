//
//  SemiModalViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import FloatingPanel

class SemiModalViewController: UIViewController {

    private var settingGroup: String!
    private var closeBtn: SemiModalCloseButton!
    private var floatingPanelController: FloatingPanelController!
    
    init(settingGroup: String, fpc: FloatingPanelController) {
        super.init(nibName: nil, bundle: nil)
        self.settingGroup = settingGroup
        self.floatingPanelController = fpc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
    }
    
    private func setUpUI() {
        self.view.backgroundColor = HMDColor.white
        
        var count = 0
        for (index, item) in Setting.getSettingGroupFromParentName(name: settingGroup).enumerated() {
            let column = SemiModalColumnView(setting: Setting.getSettingFromName(name: item[0]), itemNumber: index)
            self.view.addSubview(column)
            count += 1
        }
        
        closeBtn = SemiModalCloseButton(minY: CGFloat(count * 60 + 30 + 10))
        closeBtn.addTarget(self, action: #selector(self.tapClose), for: .touchUpInside)
        self.view.addSubview(closeBtn)
        
    }
    
    @objc func tapClose() {
        self.floatingPanelController.removePanelFromParent(animated: true)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

//
//  SettingTableView.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/26.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class SettingTableView: UITableView {

    init(frame: CGRect) {
        super.init(frame: frame, style: .plain)
        self.backgroundColor    = HMDColor.white
        self.rowHeight          = 40
        self.estimatedRowHeight = 40
        self.separatorStyle     = .none
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//
//  FriendTableView.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class FriendTableView: UITableView {
    
    init(frame: CGRect) {
        super.init(frame: frame, style: UITableView.Style.plain)
        self.estimatedRowHeight = 60
        self.rowHeight          = 60
        self.backgroundColor    = HMDColor.white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

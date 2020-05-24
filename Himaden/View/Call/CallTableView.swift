//
//  CallTableView.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class CallTableView: UITableView {

    init(frame: CGRect) {
        super.init(frame: frame, style: .plain)
        self.rowHeight          = 60
        self.estimatedRowHeight = 60
        self.backgroundColor    = HMDColor.white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

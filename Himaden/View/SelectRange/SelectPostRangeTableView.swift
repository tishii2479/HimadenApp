//
//  SelectPostRangeTableView.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class SelectPostRangeTableView: UITableView {

    init(frame: CGRect) {
        super.init(frame: frame, style: .plain)
        self.rowHeight          = 50
        self.estimatedRowHeight = 50
        self.backgroundColor    = HMDColor.white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

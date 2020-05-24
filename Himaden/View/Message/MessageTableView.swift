//
//  MessageTableView.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/23.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class MessageTableView: UITableView {
    
    init(frame: CGRect) {
        super.init(frame: frame, style: UITableView.Style.plain)
        self.estimatedRowHeight = 5
        self.rowHeight          = UITableView.automaticDimension
        self.backgroundColor    = HMDColor.white
        self.separatorStyle     = .none
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

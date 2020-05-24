//
//  HMDNavigationBar.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/07.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class HMDNavigationBar: UINavigationBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    private func setUp() {
        self.barTintColor = HMDColor.orange
        self.tintColor = HMDColor.white
        self.titleTextAttributes = [
            .foregroundColor: HMDColor.white
        ]
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

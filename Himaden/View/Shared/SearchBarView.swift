//
//  SearchBarView.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class SearchBarView: UISearchBar {

    private let padding: CGFloat = 5
    private let barHeight: CGFloat = 50
    private let btnWidth: CGFloat = 80
    private var vc: HMDSearchBarViewController!
    
    init(origin: CGPoint, vc: HMDSearchBarViewController) {
        super.init(frame: CGRect(origin: origin, size: CGSize(width: UIScreen.main.bounds.width, height: barHeight)))
        self.vc                 = vc
        self.barTintColor       = HMDColor.orange
        self.tintColor          = HMDColor.white
        self.delegate           = self.vc
        
        self.searchTextField.backgroundColor   = HMDColor.white
        self.searchTextField.placeholder       = "検索"
        self.searchTextField.tintColor         = HMDColor.orange
        self.searchTextField.font              = HMDFont.little
        self.searchTextField.layer.cornerRadius = 5
        
    }
    
    func inputDidStart() {
        self.setShowsCancelButton(true, animated: true)
    }
    
    func inputDidEnd() {
        self.setShowsCancelButton(false, animated: true)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

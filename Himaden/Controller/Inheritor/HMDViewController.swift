//
//  HMDViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/22.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class HMDViewController: UIViewController {
    
    let screenSize: CGRect   = UIScreen.main.bounds
    var navBar: UINavigationBar!
    let navBarHeight: CGFloat = 44
    
    let statusBarHeight: CGFloat = AppUtils.statusBarHeight

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setNavigationTitle(title: String) {
        self.parent?.navigationItem.title = title
    }
    
}


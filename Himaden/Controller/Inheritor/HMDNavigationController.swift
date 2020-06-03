//
//  HMDNavigationController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/25.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class HMDNavigationController: UINavigationController {
    
    convenience init(rootVC: UIViewController, naviBarClass: AnyClass?, toolbarClass: AnyClass?){
        self.init(navigationBarClass: naviBarClass, toolbarClass: toolbarClass)
        self.viewControllers = [rootVC]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

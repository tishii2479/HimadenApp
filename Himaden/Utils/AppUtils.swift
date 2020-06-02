//
//  AppUtils.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/30.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import RealmSwift

class AppUtils {
    
    static let userDefaults = UserDefaults.standard
    static var statusBarHeight: CGFloat = 44
    static var nowCalling: Bool = false
    static var selfInformation: Account?
    
    // Transition to first screen
    class func transitionToFirstView(window: UIWindow?) {
        // Comment below to use it normally
//        userDefaults.removeObject(forKey: "userId")
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        checkFirstAccessAndSetFirstViewController(window: window)
        window?.makeKeyAndVisible()
    }
    
    // Check if it is the first access
    class func checkFirstAccessAndSetFirstViewController(window: UIWindow?) {
        if userDefaults.string(forKey: "userId") != nil {
            // The user has an account for this app
            let tc      = HMDTabBarController()
            let nvc     = HMDNavigationController(rootVC: tc, naviBarClass: HMDNavigationBar.self, toolbarClass: nil)
            window?.rootViewController = nvc
        } else {
            // First use of app
            let svc     = StartViewController()
            window?.rootViewController = svc
        }
    }
        
}

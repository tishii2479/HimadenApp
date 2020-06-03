//
//  TabBarController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/23.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class HMDTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    private func setUp() {
        
        self.tabBar.barTintColor    = HMDColor.lightOrange
        self.tabBar.tintColor       = HMDColor.orange
        self.tabBar.unselectedItemTintColor = HMDColor.white
        
        let dcVC        = CallingViewController()
        let fListVC     = FriendListViewController()
        let bBoardVC    = BulletinBoardViewController()
        let profileVC   = ProfileViewController()
        
        dcVC.tabBarItem         = UITabBarItem(tabBarSystemItem: .search,    tag: 0)
        fListVC.tabBarItem      = UITabBarItem(tabBarSystemItem: .contacts,  tag: 1)
        bBoardVC.tabBarItem     = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        profileVC.tabBarItem    = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
        
        self.setViewControllers([dcVC, fListVC, bBoardVC, profileVC], animated: true)
    }
    
}

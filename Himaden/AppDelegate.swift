//
//  AppDelegate.swift
//  Himaden
// 
//  Created by tishii2479 on 2020/04/22.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import SkyWay
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var skyWayAPIKey: String = "7ff8070c-aea2-44ea-935f-258b0bd401f2"
    var skyWayDomain: String = "localhost"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Set up Skyway
        SkywayUtils.setUpSkyway()
        
        // Set up Firebase
        FirebaseApp.configure()
        
        // Transition to first ViewController
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if #available(iOS 13.0, *) {
            
        } else {
            AppUtils.transitionToFirstView(window: self.window)
        }
        return true
    }
    
    
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    } 
    func applicationWillTerminate(_ application: UIApplication) {
        SkywayUtils.peer?.disconnect()
        SkywayUtils.peer?.destroy()
    }

}


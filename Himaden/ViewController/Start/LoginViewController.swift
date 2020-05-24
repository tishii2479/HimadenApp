//
//  LoginViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/30.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import BAFluidView
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {
    
    private lazy var orangeFluid: BAFluidView = {
        let fluid = BAFluidView(frame: self.view.frame, startElevation: 0)
        fluid.maxAmplitude      = 10
        fluid.fillDuration      = 5
        fluid.strokeColor       = HMDColor.white
        fluid.fillColor         = HMDColor.orange
        fluid.fillRepeatCount   = 1
        fluid.fillAutoReverse   = false
        
        return fluid
    }()
    
    private lazy var tile: LoginAccountTile = LoginAccountTile(vc: self)
    
    private lazy var backButton = StartBackButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Set tile below the screen to pop up when the view did appear
        self.tile.center.y = UIScreen.main.bounds.height * 3 / 2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Animation: tile moves to center
        UIView.animate(withDuration: 1, animations: {
            self.tile.center.y = UIScreen.main.bounds.height / 2
        })
        
        // Orange wave animation: fill to center
        orangeFluid.fill(to: 0.5)
        orangeFluid.startAnimation()
    }
    
    private func setUpUI() {
        // Set background color
        self.view.backgroundColor = HMDColor.white
        
        // Add subview
        self.view.addSubview(orangeFluid)
        self.view.addSubview(tile)
        self.view.addSubview(backButton)
        
        // Add button targets
        backButton.addTarget(self, action: #selector(self.tapBack), for: .touchUpInside)
    }
    
    // This method is called when loginButton is tapped
    @objc func tapLoginBtn() {
        
        // Get user input
        let input = tile.getUserInput()
        
        // Check nil of email and password
        guard let email = input["email"]??.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        guard let password = input["password"]??.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        
        // Sign in
        Auth.auth().signIn(withEmail: email, password: password, completion: { (result, error) in
            if error != nil {
                // Could not sign in
                self.tile.setErrorText(text: "メールアドレス、パスワードが間違っています")
            } else {
                // Login successed
                self.tile.setErrorText(text: "ログイン完了！")
                
                let accounts = Firestore.firestore().collection("accounts")
                
                // TODO: To get userId when logging in, I only found out to search a data which field email
                // is equal to the input that has successed to login.
                // I think there should be a more easier, and more efficient way to complete this process.
                
                accounts.whereField("email", isEqualTo: email).getDocuments(completion: { (result, err) in
                    if let err = err {
                        print("[error] document wasn't fetchable, error: \(err)")
                    } else {
                        // There should be only 1 data
                        if result?.documents.count != 1 {
                            print("[error] result count is invalid, check database")
                        } else {
                            // Found data
                            if let userId = result?.documents[0]["userId"] as? String {
                                // UserId was convertable to String
                                // Save account data to UserDefaults
                                AppUtils.userDefaults.set(userId, forKey: "userId")
                                AccountUtils.saveUserAccountInformation(userId: userId)
                            } else {
                                // UserId wasn't convertable to String
                                print("[error] userId wasn't fetchable")
                            }
                        }
                        
                    }
                    
                })
                
                
                // Orange wave animation: fill to top
                self.orangeFluid.fill(to: 1)
                self.orangeFluid.startAnimation()
                
                // Animation: tile and back button invisible
                UIView.animate(withDuration: 2, animations: {
                    self.tile.alpha = 0
                    self.backButton.alpha = 0
                })
                
                // Transition to main view
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    let tc      = HMDTabBarController()
                    let nvc     = HMDNavigationController(rootVC: tc, naviBarClass: HMDNavigationBar.self, toolbarClass: nil)
                    
                    nvc.modalPresentationStyle      = .fullScreen
                    self.present(nvc, animated: true, completion: nil)
                })
            }
        })

    }
    
    // This method is called when backButton is tapped
    @objc func tapBack() {
        // Orange wave animation: fill to top
        orangeFluid.fillDuration = 1
        orangeFluid.fill(to: 1)
        orangeFluid.startAnimation()
        
        // Animation: tile goes upward, and backButton becomes invisible
        UIView.animate(withDuration: 1, animations: {
            self.tile.center.y          = 2 * UIScreen.main.bounds.height
            self.backButton.alpha       = 0
        })
        
        // After the tile goes up and orange wave fills to the top, dismiss to first view
        // 1.2 meaning is that it is 0.2s after the animation ended
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    // Dismiss the keyboard when the user touches the other part of the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

//
//  CreateAccountViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/30.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import BAFluidView
import Firebase

class CreateAccountViewController: UIViewController {
    
    private var item: AccountUtils.Item!
    
    private var itemInfo: AccountUtils.Info!
    
    // The count which holds the item which is now inputting
    private var nowItemCount: Int = 0
    
    // Max count of input items
    private let itemMax: Int = AccountUtils.paramName.count
    
    private let initialWaveHeight: Double = 0.3
    
    private var accountData: [AccountUtils.Item : String] = [:]
    
    private var backButton = StartBackButton()
    
    private lazy var startButton: StartRoundedButton = StartRoundedButton(frame: CGRect(x: Util.getMinXForCentering(width: 250), y: UIScreen.main.bounds.height - 100, width: 250, height: 50), text: "さあ、はじめよう")
    
    private lazy var tile: CreateAccountTile = CreateAccountTile(vc: self)
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Animation: tile appears to the center of the screen
        UIView.animate(withDuration: 1, animations: {
            self.tile.center.y = UIScreen.main.bounds.height / 2
        })
        
        // Orange wave animation: fill to initialWaveHeight
        orangeFluid.fill(to: NSNumber(value: initialWaveHeight))
        orangeFluid.startAnimation()
    }
    
    private func setUpUI() {
        // Set background color
        self.view.backgroundColor = HMDColor.white
        
        // Add subview
        self.view.addSubview(orangeFluid)
        self.view.addSubview(tile)
        self.view.addSubview(backButton)
        self.view.addSubview(startButton)
        
        // Initalize tile information
        self.setItemInfo()
        
        // Make startButton invisible
        startButton.alpha = 0
        
        // Add button targets
        startButton.addTarget(self, action: #selector(self.tapStart), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(self.tapBack), for: .touchUpInside)
    }
    
    // Call this method to set the tile information
    // Before calling this method, nowItemCount should be changed to the proper amount
    private func setItemInfo() {
        self.item = AccountUtils.Item(rawValue: nowItemCount)
        self.itemInfo = AccountUtils.itemInfo[self.item]
        tile.setPlaceHolder(text: itemInfo.placeHolder)
        tile.setTopLabelText(text: itemInfo.title)
        tile.setInputView(item: self.item)
    }
    
    // Calculate the next orangeWave height using [nowItemCount]
    private func getNextElevationHeight() -> NSNumber {
        return NSNumber(value: Double(nowItemCount) / Double(itemMax) * (1.0 - initialWaveHeight) + initialWaveHeight)
    }
    
    // This method is called when user tapped backButton
    @objc func tapBack() {
        
        if nowItemCount > 0 {
            // If there is a item before this, return to it
            
            // Delete the data that was inputted most recently
            self.accountData.removeValue(forKey: self.item)
            // Dismiss the keyboard
            self.view.endEditing(true)
            
            // Get back to the previous item
            nowItemCount -= 1
            
            // Orange wave animation: fill to the height of the previous item
            orangeFluid.fill(to: getNextElevationHeight())
            orangeFluid.startAnimation()
            
            // Tile animation
            tileGoesDownAndAppearsFromTop()
            
            // When the tile is out of screen, update the tile data
            updateTileData()
            
        } else {
            // If the user was at the first item of account input
            
            // Get back to the start view
            dismissToStart()
        }
    }
    
    // This method is called when the user tapped next after/before inputting their data
    // In this method, we validate the user input, and if there is a problem, shows an error message
    // on the screen. Otherwise, we let the use go to the next stage of data input
    @objc func tapNext() {
        // Check nil of input
        guard let input: String = tile.getInput() as? String else {
            print("Input is nil")
            return
        }
        
        // Remove tabspaces and newLines from inputs
        let formattedInput: String = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Validate the input
        let errorMessage: String? = AccountValidation.checkValidation(userInput: formattedInput, item: item)
        
        if errorMessage == nil {
            // Input was valid
            
            // Set data to accountData
            self.accountData.updateValue(formattedInput, forKey: item)

            // Hide the inputview
            self.view.endEditing(true)

            // Go to next item
            nowItemCount += 1
            
            if nowItemCount < itemMax {
                // If there is still an account item to input
                
                // Orange wave animation: fill to the next item height
                orangeFluid.fill(to: getNextElevationHeight())
                orangeFluid.startAnimation()
                
                // When the tile is out of screen, update the tile datas
                updateTileData()
                
                // Tile animation
                tileGoesUpAndAppearsFromBottom()
            } else {
                
                // After inputting password
                print("End Of Inputting Data")
                
                // Orange wave animation: fill to top
                orangeFluid.fill(to: 1)
                orangeFluid.startAnimation()
                
                inputDidEnd()
            }
        } else {
            
            // Input was invalid
            print("Validation Error, user input was invalid")
            self.tile.setErrorLabel(text: errorMessage!)
        }
    }
    
    // This method is a target of the startButton
    // In this method, the user transition to the main view of this app
    @objc func tapStart() {
        print("Start")
        
        let tc      = HMDTabBarController()
        let nvc     = HMDNavigationController(rootVC: tc, naviBarClass: HMDNavigationBar.self, toolbarClass: nil)
        
        nvc.modalPresentationStyle      = .fullScreen
        self.present(nvc, animated: true, completion: nil)
    }
    
    // This method update the tile data
    func updateTileData() {
        
        // Update tile data
        // The meaning of 0.5 is that it is the timing when tile is out of screen
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            // Reset the tile texts
            self.tile.setFieldText(text: "")
            self.tile.setErrorLabel(text: "")
            
            // Set placeholder and title
            self.setItemInfo()
        })
    }
    
    // This is a method of an animation to make the tile go downwards,
    // and make it reveal from the top.
    // This method should be called when the user tapped to go back while inputting
    private func tileGoesDownAndAppearsFromTop() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            // Animation: tile goes down and disappears
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.tile.center.y          = 2 * UIScreen.main.bounds.height
            })
            // Animation: tile gets invisible, and moves to the top of the screen
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0, animations: {
                self.tile.alpha = 0
                self.tile.center.y = UIScreen.main.bounds.height * -1
            })
            // Animation: while the tile gets visible, it moves to the center of the screen and appears
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.tile.alpha = 1
                self.tile.center.y = UIScreen.main.bounds.height / 2
            })
        }, completion: { (result) in
            print("Tile animation complete")
        })
    }
    
    // This is a method of an animation to make the tile go upwards,
    // and make it reveal from the bottom.
    // This method should be called when the use tapped to go next while inputting
    private func tileGoesUpAndAppearsFromBottom() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            // Animation: tile goes up and disappears
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.tile.center.y = -1 * UIScreen.main.bounds.height
            })
            // Animation: tile gets invisible, and move to the bottom of the screen
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0, animations: {
                self.tile.alpha = 0
                self.tile.center.y = UIScreen.main.bounds.height * 2
            })
            // Animation: while the tile gets visible, it moves to the center of the screen and appears
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.tile.alpha = 1
                self.tile.center.y = UIScreen.main.bounds.height / 2
            })
        }, completion: { (result) in
            print("Tile animation complete")
        })
    }
    
    // This method is called when all authetication data has been inputted
    // In this method, using the data, we access to firebase authtication to make an account
    // for the user.
    private func inputDidEnd() {
        print(self.accountData)
        
        // Create account with data
        Auth.auth().createUser(withEmail: self.accountData[.email]!, password: self.accountData[.password]!, completion: { (result, err) in
            
            // Check for errors
            if err != nil {
                self.tile.setErrorLabel(text: "アカウントの作成に失敗しました")
                print("[error] creating user: \(err)")
            } else {
                // Creating account has succeded
                self.tile.setErrorLabel(text: "アカウントを作成しました！")
                print("Creating account has succeded")
                
                // User was created successfully, store the data in the database
                let accounts = Firestore.firestore().collection("accounts")
                let userId: String = self.accountData[.userId]!
                
                // Process data into proper shape
                var processedSex: Int!
                
                switch self.accountData[.sex] {
                case "男性":
                    processedSex = 1
                case "女性":
                    processedSex = 2
                default:
                    processedSex = 0
                }
                
                // Add account data to firestore
                accounts.document(userId).setData([
                    "name"          : self.accountData[.name]!,
                    "email"         : self.accountData[.email]!,
                    "password"      : self.accountData[.password]!,
                    "sex"           : processedSex!,
                    "birthday"      : self.accountData[.birthday]!,
                    "prefecture"    : self.accountData[.prefecture]!,
                    "comment"       : "",
                ], completion: { (err) in
                    // Error occured in adding account data of database
                    if err != nil { print("[error] creating account to the database") }
                })
                
                // Save account data to UserDefaults
                AppUtils.userDefaults.set(userId, forKey: "userId")
                AccountUtils.saveUserAccountInformation(userId: userId)
                
                // Reveal the start button
                UIView.animate(withDuration: 1, animations: {
                    self.tile.center.y          = -1 * UIScreen.main.bounds.height
                    self.startButton.alpha      = 1
                    self.backButton.alpha       = 0
                })
            }
            
        })
        
    }
    
    // This method is called when user tapped to go back to the start view
    private func dismissToStart() {
        
        // Remove all inputted data
        self.accountData.removeAll()
        
        // Orange wave animation: fill to top
        orangeFluid.fillDuration = 1
        orangeFluid.fill(to: 1)
        orangeFluid.startAnimation()
        
        // Animation: move tile below the screen, set backButton unpressable
        UIView.animate(withDuration: 1, animations: {
            self.tile.center.y          = 2 * UIScreen.main.bounds.height
            self.backButton.alpha       = 0
        })
        
        // After the animation ended, dismiss to start view
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    // This method is called when the user is inputting their birthday
    // This is called because the user selected date should be formatted into japanese
    @objc func birthdayPickerValueChange(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        tile.setFieldText(text: formatter.string(from: sender.date))
    }
    
    // Dismiss the keyboard when the user touches the other part of the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

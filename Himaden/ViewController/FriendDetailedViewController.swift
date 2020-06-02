//
//  FriendDetailedViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import FloatingPanel

class FriendDetailedViewController: HMDPostBoardController {

    fileprivate let profileHeight: CGFloat = 400
    
    fileprivate var friend: Friend!
    
    fileprivate var tabController: UITabBarController!
    
    fileprivate lazy var clearNavBar: ClearNavigationBar = ClearNavigationBar(vc: self, leftTitle: "閉じる", rightTitle: "", centerTitle: nil)
    
    fileprivate lazy var profileView: ProfileView = ProfileView(frame: CGRect(x: 0, y: clearNavBar.frame.maxY, width: UIScreen.main.bounds.width, height: profileHeight), vc: self)
    
    fileprivate lazy var postLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: profileView.frame.maxY, width: UIScreen.main.bounds.width, height: 40))
        label.backgroundColor   = HMDColor.white
        label.layer.borderWidth = 1
        label.layer.borderColor = HMDColor.lightGray.cgColor
        label.textAlignment     = .center
        label.text              = "投稿"
        label.font              = HMDFont.big
        label.textColor         = HMDColor.black
        
        return label
    }()
    
    fileprivate lazy var postTableView: PostTableView = {
        let table = PostTableView(frame: CGRect(x: 0, y: postLabel.frame.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - postLabel.frame.maxY))
        table.register(PostTableViewCell.self, forCellReuseIdentifier: postCellIdentifier)
        table.delegate      = self
        table.dataSource    = self
        
        return table
    }()
    
    fileprivate var floatingPanelController: FloatingPanelController = FloatingPanelController()
    
    fileprivate let settingGroup: String = "FriendSetting"
    
    init(friend: Friend, tabBarController: UITabBarController) {
        super.init(nibName: nil, bundle: nil)
        
        self.friend         = friend
        self.tabController  = tabBarController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        floatingPanelController.delegate = self
        setUpUI()
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
        
        // For HMDPostBoardViewController
        self.tableView = postTableView
        
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        floatingPanelController.removePanelFromParent(animated: true)
    }
    
    func setUpUI() {
        // Set background color
        self.view.backgroundColor = HMDColor.white
        
        // Set account to profileView
        profileView.setAccountInfo(friend: self.friend)
        
        // Add subview
        self.view.addSubview(profileView)
        self.view.addSubview(postLabel)
        self.view.addSubview(postTableView)
        self.view.addSubview(clearNavBar)
    }
    
    // This method is called when callButton is tapped
    @objc func tapCall() {
        guard let _ = SkywayUtils.peer else { return }
        
        let message = self.friend.name + "に通話をかけます"
        
        // Present Alert views
        HMDAlertController.twoButton(vc: self, "確認", message: message, okHandler: { (alert) in
            let callingVC = self.tabController.viewControllers?[0] as! CallingViewController
            callingVC.connect(targetPeerId: self.friend.id)
             
            self.tabController.selectedViewController = callingVC
            
            self.dismiss(animated: true, completion: nil)
        }, noHandler: nil)
        
    }
    
    @objc func tapSettingBtn() {
        let semiModalViewController = SemiModalViewController(settingGroup: settingGroup, fpc: floatingPanelController)
        floatingPanelController.set(contentViewController: semiModalViewController)
        floatingPanelController.addPanel(toParent: self, belowView: nil, animated: true)
        floatingPanelController.surfaceView.cornerRadius = 30
    }
    
    @objc func tapLeftBtn() {
        self.dismiss(animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension FriendDetailedViewController: FloatingPanelControllerDelegate {
    func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
        let settingColumnCount = SettingUtils.getSettingGroupFromParentName(name: settingGroup).count
        return HMDFloatingPanelLayout(columnCount: settingColumnCount)
    }
    
    func floatingPanelDidEndDragging(_ vc: FloatingPanelController, withVelocity velocity: CGPoint, targetPosition: FloatingPanelPosition) {
        switch targetPosition {
        case .tip:
            print("tip")
            floatingPanelController.removePanelFromParent(animated: true)
        case .half:
            print("half")
        default:
            print("default")
        }
    }
}

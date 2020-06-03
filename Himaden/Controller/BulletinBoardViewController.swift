//
//  BulletinBoardViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/23.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import FirebaseFirestore
import RealmSwift

class BulletinBoardViewController: HMDPostBoardController {

    private lazy var postTableView: PostTableView = {
        let table = PostTableView(frame: CGRect(x: 0, y: statusBarHeight + navBarHeight, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - statusBarHeight - navBarHeight))
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "Cell")
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    private lazy var createPostBtn: CreatePostButton = CreatePostButton(vc: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
    }
    
    override func viewWillLayoutSubviews() {
        // For HMDPostBoardViewController
        self.tableView = postTableView
        
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationTitle(title: "タイムライン")
    }
    
    private func setUpUI() {
        // Set background color
        self.view.backgroundColor = HMDColor.white
        
        // Add subview
        self.view.addSubview(postTableView)
        self.view.addSubview(createPostBtn)
    }
    
    // This method is called when createPostButton is tapped
    // In this method, create post view will be presented
    @objc func tapCreateBtn() {
        let createVC = CreatePostViewController()
        let navVC = HMDNavigationController(rootViewController: createVC)
        navVC.modalPresentationStyle = .fullScreen
        navVC.isNavigationBarHidden = true
        self.present(navVC, animated: true, completion: nil)
    }
    
}

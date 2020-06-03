//
//  FriendListViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/23.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import RealmSwift

class FriendListViewController: HMDSearchBarViewController {

    // Header titles for table
    private let headerTitles: [String] = ["オンライン", "通話中のグループ", "通話中の友達", "オフライン"]

    // Search bar height
    private let searchBarHeight: CGFloat = 50
    
    private lazy var friendTableView: FriendTableView = {
        let table = FriendTableView(frame: CGRect(x: 0, y: friendSearchBar.frame.maxY, width: screenSize.width, height: screenSize.height - friendSearchBar.frame.maxY))
        table.register(FriendTableViewCell.self, forCellReuseIdentifier: "Cell")
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
    }
    
    override func viewWillLayoutSubviews() {
        // This is needed to implement HMDSearchbarViewController
        self.tableView = friendTableView

        setNavigationTitle(title: "友だち")
        
        super.viewWillLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setUpUI() {
        // Set background colors
        self.view.backgroundColor = HMDColor.white
    
        // Add subview
        self.view.addSubview(friendTableView)
    }
    
}

extension FriendListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Friend Table tapped at indexPath: \(indexPath)")
        
        // Present to friend detailed view
        let friendVC = FriendDetailedViewController(friend: friends[indexPath.section][indexPath.row], tabBarController: self.tabBarController!)
        let navVC = HMDNavigationController(rootViewController: friendVC)
        navVC.modalPresentationStyle = .fullScreen
        
        self.present(navVC, animated: true, completion: {
            print("Present to FriendDetailedViewController with account: \(self.friends[indexPath.section][indexPath.row])")
        })
        
    }
}

extension FriendListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = FriendTableHeader()
        header.setTitleText(text: headerTitles[section])
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: If friends.count get smaller, this method occurs an error
        
        if section < friends.count {
            return friends[section].count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FriendTableViewCell
        
        // Set cells
        cell.setUpComponents(friend: friends[indexPath.section][indexPath.row])
        
        return cell
    }
    
}

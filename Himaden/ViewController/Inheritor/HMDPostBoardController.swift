//
//  HMDPostBoardController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class HMDPostBoardController: HMDViewController {
    var posts: [Post] = [Post()]
    var postCellIdentifier: String = "Cell"
}


extension HMDPostBoardController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Post Table tapped at indexPath: \(indexPath)")

        let postVC = PostViewController(post: posts[indexPath.row])
        self.navigationController?.pushViewController(postVC, animated: true)
    }
}

extension HMDPostBoardController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postCellIdentifier, for: indexPath) as! PostTableViewCell
        
        cell.setUpComponents(post: posts[indexPath.row])
        cell.iconImage.addTarget(self, action: #selector(self.tapIcon(_:)), for: .touchUpInside)
        cell.iconImage.tag = indexPath.row
        
        return cell
    }
    
    @objc func tapIcon(_ sender: UIButton) {
        print("tapIcon tag: \(sender.tag)")
        
        let friendVC = FriendDetailedViewController(friend: Account(), tabBarController: self.tabBarController!)
        let navVC = HMDNavigationController(rootVC: friendVC, naviBarClass: HMDNavigationBar.self, toolbarClass: nil)
        navVC.modalPresentationStyle = .fullScreen
        
        self.present(navVC, animated: true, completion: {
            print("Present to FriendDetailedViewController with account: \(Account())")
        })
    }
}


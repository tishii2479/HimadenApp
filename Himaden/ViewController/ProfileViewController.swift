//
//  ProfileViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/23.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import RealmSwift
import FirebaseFirestore

class ProfileViewController: HMDViewController {
    
    // Declaring explanatory variable
    fileprivate let POST: Int = 0
    fileprivate let CALL: Int = 1
    
    // Profile view height
    fileprivate let profileHeight: CGFloat = 300
    
    fileprivate lazy var profileView: ProfileView = ProfileView(frame: CGRect(x: 0, y: statusBarHeight + navBarHeight, width: UIScreen.main.bounds.width, height: profileHeight), vc: self)
    
    fileprivate lazy var profileToolBarView: ProfileToolBarView = ProfileToolBarView(origin: CGPoint(x: 0, y: profileView.frame.maxY), vc: self)
    
    fileprivate lazy var postTableView: PostTableView = {
        let table = PostTableView(frame: CGRect(x: 0, y: profileToolBarView.frame.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - profileToolBarView.frame.maxY))
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableCell")
        table.delegate      = self
        table.dataSource    = self
        table.tag           = POST
        
        return table
    }()
    
    fileprivate lazy var callTableView: CallTableView = {
        let table = CallTableView(frame: CGRect(x: 0, y: profileToolBarView.frame.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - profileToolBarView.frame.maxY))
        table.register(CallTableViewCell.self, forCellReuseIdentifier: "CallTableCell")
        table.delegate      = self
        table.dataSource    = self
        table.tag           = CALL
        
        return table
    }()

    fileprivate var posts: [Post] = []
    
    fileprivate var calls: [Call] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        
        self.setUserData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationTitle(title: "プロフィール")
        
        self.loadPostTable()
        self.loadCallTable()
    }
    
    private func setUpUI() {
        // Set background color
        self.view.backgroundColor = HMDColor.white
        
        // Set add subview
        self.view.addSubview(profileView)
        self.view.addSubview(profileToolBarView)
        self.view.addSubview(postTableView)
    }
    
    private func setUserData() {
        
        // Set user data
        do {
            // Read realm to fetch this user's data
            let realm = try Realm()
            let selfUserId: String = AppUtils.userDefaults.string(forKey: "userId")!
            
            // Search for my data
            if let selfData: Account = realm.objects(Account.self).filter("id == '\(selfUserId)'").first {
                // Data found
                
                print("[debug] account found: \(selfData)")
                
                self.profileView.setAccountInfo(friend: selfData)
            } else {
                // Data not found
                print("[error] data doesnt exist, signing up is not working")

                // TODO: show users sign up did not go well
            }
        } catch {
            print("[error] Realm load did not work")
            
            // TODO: Error screen
        }
    }
    
    private func loadCallTable() {
        // Load data from firebase
        // If it is offline read data from realm
        
        if calls.count == 0 {
        
            print("[debug] Reload call table")
            
            let calls = Firestore.firestore().collection("calls")
            
            calls.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    
                    // TODO: Fetch data from realm
                    
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        print("\(document.documentID) => \(data)")
                        
                        let call = Call(senderName: data["senderName"] as! String, receiverName: data["receiverName"] as! String)
                        self.calls.append(call)
                    }
                }

                self.callTableView.reloadData()
            }
        }
    }
    
    private func loadPostTable() {
        // Load data from firebase
        // If it is offline read data from realm
    
        if posts.count == 0 {
            print("[debug] Reload call table_________")
            
            let posts = Firestore.firestore().collection("posts")
            
            posts.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    
                    // TODO: Fetch data from realm
                    
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        print("\(document.documentID) => \(data)")
                        
                        let post = Post(text: data["text"] as! String)
                        self.posts.append(post)
                    }
                }

                self.postTableView.reloadData()
            }
        }
    }
    
    // This method is called when setting button has been tapped
    @objc func tapSettingBtn() {
        // Present to setting view
        let settingVC = HMDSettingViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
    // This method is called when ProfileToolbar segment control was tapped
    @objc func segmentChanged(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case POST:
            self.view.addSubview(postTableView)
            callTableView.removeFromSuperview()
        case CALL:
            self.view.addSubview(callTableView)
            postTableView.removeFromSuperview()
        default:
            break
        }
    }
    
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == POST {
            print("Post Table tapped at indexPath: \(indexPath)")
            // Present to post view with post information
            let postVC = PostViewController(post: posts[indexPath.row])
            self.navigationController?.pushViewController(postVC, animated: true)
        } else if tableView.tag == CALL {
            print("Call Table tapped at indexPath: \(indexPath)")
            
            // Show something or call to the account or show account view
        }
    }
    
    // This function is called when scroll has occured
    // TODO: Add function that can get the scroll amount and change height of profileView and tableView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == POST {
            return posts.count
        } else {
            return calls.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == POST {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableCell", for: indexPath) as! PostTableViewCell
            
            // Set up cells
            cell.setUpComponents(post: posts[indexPath.row])
            
            // Add icon tap effects
            cell.iconImage.addTarget(self, action: #selector(self.tapIcon(_:)), for: .touchUpInside)
            cell.iconImage.tag = indexPath.row
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CallTableCell", for: indexPath) as! CallTableViewCell
            
            // Set up cells
            cell.setUpComponents(call: calls[indexPath.row], selfName: "aa")
            
            // Add icon tap effects
            cell.iconImage.addTarget(self, action: #selector(self.tapIcon(_:)), for: .touchUpInside)
            cell.iconImage.tag = indexPath.row
            
            return cell
        }
    }
    
    // This method is called when icon is tapped
    // In this method, according to the icon.tag, detailed view will be presented
    @objc func tapIcon(_ sender: UIButton) {
        print("tapIcon tag: \(sender.tag)")
        
        let friendVC = FriendDetailedViewController(friend: Account(), tabBarController: self.tabBarController!)
        let navVC = HMDNavigationController(rootViewController: friendVC)
        navVC.modalPresentationStyle = .fullScreen
        
        self.present(navVC, animated: true, completion: {
            print("Present to FriendDetailedViewController with account: \(Account())")
        })
    }
    
}

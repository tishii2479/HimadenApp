//
//  HMDSearchBarViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/07.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import RealmSwift

class HMDSearchBarViewController: HMDViewController {
    
    lazy var friendSearchBar: SearchBarView = {
        let bar = SearchBarView(origin: CGPoint(x: 0, y:
            statusBarHeight + navBarHeight), vc: self)
        
        return bar
    }()
    var friends: [[Friend]] = [[Account()], [Group()], [Account()], [Group()]]
    
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(friendSearchBar)
    }
    
    override func viewWillLayoutSubviews() {
        self.loadFriendTable()
    }
    
    func loadFriendTable() {
        // Firebase friend data load and realm data load
        print("[debug] Reload friend table")
        
        // Reload from firebase
        do {
            let realm = try Realm()
            
            let accounts = Array(realm.objects(Account.self))
            let groups = Array(realm.objects(Group.self))
            
            // TODO: Separate it by status
            var onlineAccount = [Friend]()
            var onlineGroup = [Friend]()
            var nowCallingAccount = [Friend]()
            var offline = [Friend]()
            
            for acc in accounts {
                if acc.status == 0 {
                    nowCallingAccount.append(acc)
                } else if acc.status == 1 {
                    onlineAccount.append(acc)
                } else if acc.status == 2 {
                    offline.append(acc)
                }
            }
            
            for gro in groups {
                if gro.status == 1 {
                    onlineGroup.append(gro)
                } else if gro.status == 2 {
                    offline.append(gro)
                }
            }
            
            self.friends = [onlineAccount, onlineGroup, nowCallingAccount, offline]
            
            self.tableView?.reloadData()
        } catch {
            print("[error] realm is not working")
            
            // TODO: error screen
        }
        
    }
}

extension HMDSearchBarViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        friendSearchBar.inputDidStart()
    }
    
    func searchBarDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        friendSearchBar.inputDidEnd()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        friendSearchBar.inputDidEnd()
        print("tapped close")
    }
    
    // This method is called when searchBar search method is called
    // TODO: 
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search Button Clicked")
        if let searchText = searchBar.searchTextField.text {
            print("Search Text: \(searchText)")
            self.friends = searchWithSearchText(searchText: searchText, friends: self.friends)
            self.tableView?.reloadData()
        } else {
            print("[error] searchText is nil in some reason")
        }
    }
    
    func searchWithSearchText(searchText: String, friends: [[Friend]]) -> [[Friend]] {
        return [[Account(), Group()]]
    }
}

//
//  HMDSearchBarViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/07.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

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

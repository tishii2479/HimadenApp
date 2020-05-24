//
//  SelectPostRangeViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class SelectPostRangeViewController: HMDSearchBarViewController {

    fileprivate lazy var clearNavBar: ClearNavigationBar = ClearNavigationBar(vc: self, leftTitle: "戻る", rightTitle: "投稿する", centerTitle: "投稿範囲の決定")
    fileprivate lazy var selectPostRangeTableView: SelectPostRangeTableView = {
        let table = SelectPostRangeTableView(frame: CGRect(x: 0, y: friendSearchBar.frame.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - friendSearchBar.frame.maxY))
        table.register(SelectPostRangeTableViewCell.self, forCellReuseIdentifier: "Cell")
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
    }
    
    private func setUpUI() {
        // Set background color
        self.view.backgroundColor       = HMDColor.white
        
        // This is to implement HMDSearchbarViewController
        self.tableView = selectPostRangeTableView
        
        // Add subviews
        self.view.addSubview(clearNavBar)
        self.view.addSubview(selectPostRangeTableView)
    }
    
    // This method is called when clearNavigationBar left button was tapped
    @objc func tapLeft() {
        // Present to previous view
        self.navigationController?.popViewController(animated: true)
    }
    
    // This method is called when clearNavigationBar right button was tapped
    @objc func tapRight() {
        print("Tap Create Post")
    }

}

extension SelectPostRangeViewController: UITableViewDelegate {
    
}

extension SelectPostRangeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SelectPostRangeTableViewCell
        
        // Set up cells
        cell.setUpComponents(friend: friends[indexPath.section][indexPath.row], vc: self)
        return cell
    }
    
    
}

//
//  SettingViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/25.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class HMDSettingViewController: HMDViewController {

    fileprivate var settingNames: [[String]] = [["aaa"], ["bbb"]]
    fileprivate var headerTitles: [String] = ["aaaaaaa", "bbbbbbb"]
    
    fileprivate lazy var settingTableView: SettingTableView = {
        let table = SettingTableView(frame: CGRect(x: 0, y: navBarHeight + statusBarHeight, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - navBarHeight + statusBarHeight))
        table.delegate      = self
        table.dataSource    = self
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
    }
    
    // This function will be called to set the setting items
    // Called timing is before presenting to this view,
    func setSettings(settingNames: [[String]], headerTitles: [String]) {
        self.settingNames   = settingNames
        self.headerTitles   = headerTitles
    }
    
    func setUpUI() {
        // Set background color
        self.view.backgroundColor = HMDColor.white
        
        // Add subview
        self.view.addSubview(settingTableView)
    }
    
}

extension HMDSettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("SettingTable pressed at indexPath: \(indexPath)")
        
        let setting: Setting = SettingUtils.getSettingFromName(name: settingNames[indexPath.section][indexPath.row])
        
        if setting.hasChild {
            // Setting has children settings
            let nextSettingVC = HMDSettingViewController()
            
            // Set setting and header titles
            nextSettingVC.setSettings(settingNames: setting.children, headerTitles: ["aaaaaaa"])
            
            self.navigationController?.pushViewController(nextSettingVC, animated: true)
        }
    }
}

extension HMDSettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingNames[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SettingTableViewCell
        
        // Set up cells
        cell.setUpComponents(setting: SettingUtils.getSettingFromName(name: settingNames[indexPath.section][indexPath.row]))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SettingTableHeader(title: headerTitles[section])
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return SettingTableFooter()
    }
    
}

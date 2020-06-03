//
//  CreatePostViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/26.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {
    
    private let iconDiameter: CGFloat       = 60
    private let padding: CGFloat            = 20
    
    private lazy var iconImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: padding, y: clearNavBar.frame.maxY + padding, width: iconDiameter, height: iconDiameter))
        view.layer.cornerRadius     = iconDiameter / 2
        view.layer.backgroundColor  = HMDColor.lightGray.cgColor
        
        return view
    }()
    
    private lazy var textView: UITextView = {
        let view = UITextView(frame: CGRect(x: padding * 2 + iconDiameter, y: clearNavBar.frame.maxY + padding, width: UIScreen.main.bounds.width - padding * 3 - iconDiameter, height: 200))
        view.backgroundColor = HMDColor.clear
        view.font = HMDFont.middle
        
        return view
    }()
    
    private lazy var clearNavBar: ClearNavigationBar = ClearNavigationBar(vc: self, leftTitle: "閉じる", rightTitle: "進む", centerTitle: "投稿を作成")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        self.textView.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpUI() {
        // Set background color
        self.view.backgroundColor = HMDColor.white
        
        // Add subview
        self.view.addSubview(iconImage)
        self.view.addSubview(textView)
        self.view.addSubview(clearNavBar)
    }
    
    // This method is called when clearNavigationBar left button is tapped
    @objc func tapLeft() {
        // Dismiss to presenting view
        self.dismiss(animated: true, completion: nil)
    }
    
    // This method is called when clearNavigationBar right button is tapped
    @objc func tapRight() {
        // Present to select post range view
        let selectRangeVC = SelectPostRangeViewController(text: textView.text, image: Image())
        
        self.navigationController?.pushViewController(selectRangeVC, animated: true)
    }
}

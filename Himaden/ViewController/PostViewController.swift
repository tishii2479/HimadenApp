//
//  PostViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/25.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class PostViewController: HMDViewController {

    fileprivate var postInfoView: PostInfoView!
    
    fileprivate var post: Post!
    
    // When using this view controller, you have to pass a post
    init(post: Post) {
        super.init(nibName: nil, bundle: nil)
        
        // Set post
        self.post = post
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
    }
    
    func setUpUI() {
        // Set background color
        self.view.backgroundColor = HMDColor.lightGray
        
        self.postInfoView = PostInfoView(post: self.post, vc: self)
        self.navigationController?.isNavigationBarHidden = false
        
        // Add subview
        self.view.addSubview(postInfoView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

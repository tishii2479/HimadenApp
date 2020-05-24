//
//  Setting.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/26.
//  Copyright © 2020 tishii2479. All rights reserved.
//

struct Setting {
    
    var name: String
    var image: Image
    var hasChild: Bool
    var children: [[String]]
    
    init(name: String) {
        self.name = name
        self.image = Image()
        self.hasChild = false
        self.children = [["aaa", "bbb"]]
    }
    
}

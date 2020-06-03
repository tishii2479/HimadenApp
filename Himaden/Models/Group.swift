//
//  Group.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/07.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import Foundation
import RealmSwift

class Group: Object, Friend {
    
    @objc dynamic var id: String
    @objc dynamic var name: String
    @objc dynamic var icon: String
    @objc dynamic var comment: String
    @objc dynamic var status: Int = 0
    
    required init() {
        self.id      = "Group"
        self.name    = "NAME"
        self.icon    = "Icon"
        self.status  = 0
        self.comment = "comment"
    }
    
}

//
//  Post.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object {
    
    @objc dynamic var postId: Int
    @objc dynamic var ownerId: String
    @objc dynamic var ownerName: String
    @objc dynamic var groupId: String?
    @objc dynamic var mentionedFriends: String?
    @objc dynamic var text: String
    @objc dynamic var image: String?
    @objc dynamic var postedAt: Date
    
    init(text: String) {
        self.postId = 1
        self.ownerId = "aa"
        self.ownerName = "aaa"
        self.groupId = nil
        self.mentionedFriends = nil
        self.text = text
        self.image = nil
        self.postedAt = Date()
    }
    
    required init() {
        self.postId = 1
        self.ownerId = "aa"
        self.ownerName = "aaa"
        self.groupId = nil
        self.mentionedFriends = nil
        self.text = "text"
        self.image = nil
        self.postedAt = Date()
    }
}

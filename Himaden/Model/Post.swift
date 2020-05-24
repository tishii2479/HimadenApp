//
//  Post.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import Foundation

struct Post {
    
    var postId: Int
    var ownerId: String
    var ownerName: String?
    var groupId: String?
    var mentionedFriends: [String]?
    var text: String?
    var image: Image?
    var postedAt: Date
    
    init() {
        postId = 1
        ownerId = "aa"
        ownerName = "aaa"
        groupId = nil
        mentionedFriends = nil
        text = "text"
        image = Image()
        postedAt = Date()
    }
}

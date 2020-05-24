//
//  AccountForChat.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import Foundation

struct AccountWithDetail {
    
    var userId: String
    var name: String
    var icon: Image
    var email: String
    var password: String
    var birthday: Date
    var sex: Int
    var friends: [String]
    var groups: [String]
    var calls: [Call]
    var posts: [Post]
    var lastAccess: Date
    var status: Status
    var createdAt: Date
    var comment: String
    
}

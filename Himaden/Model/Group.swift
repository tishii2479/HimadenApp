//
//  Group.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/07.
//  Copyright © 2020 tishii2479. All rights reserved.
//

struct Group: Friend {
    
    var id: String
    var name: String
    var icon: Image
    var comment: String
    var status: Status
    
    init() {
        id = "Group"
        name    = "NAME"
        icon    = Image()
        status  = .calling
        comment = "comment"
    }
    
}

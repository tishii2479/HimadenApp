//
//  Account.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

struct Account: Friend {
    
    var id: String
    var name: String
    var icon: Image
    var status: Status
    var comment: String
    
    init() {
        id      = "Account"
        name    = "NAME"
        icon    = Image()
        status  = .online
        comment = "COMMENT"
    }
    
}

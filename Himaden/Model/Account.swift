//
//  AccountForChat.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import Foundation
import RealmSwift

class Account: Object, Friend {
    
    @objc dynamic var id: String
    @objc dynamic var name: String
    @objc dynamic var password: String
    @objc dynamic var prefecture: String
    @objc dynamic var birthday: String
    @objc dynamic var email: String
    @objc dynamic var sex: Int = 0
    @objc dynamic var comment: String
    @objc dynamic var icon: String
    @objc dynamic var status: Int = 0
    
    init(data: [String : Any]) {
        self.id             = data["userId"] as? String ?? "nil"
        self.name           = data["name"] as? String ?? "nil"
        self.password       = data["password"] as? String ?? "nil"
        self.prefecture     = data["prefecture"] as? String ?? "nil"
        self.birthday       = data["birthday"] as? String ?? "nil"
        self.comment        = data["comment"] as? String ?? "nil"
        self.email          = data["email"] as? String ?? "nil"
        self.icon           = "aaaaa"
        self.status         = 0
        
        if let _sex = data["sex"] as? Int {
            self.sex        = _sex
        }
    }
    
    required init() {
        self.id             = "qaaa"
        self.name           = "aaaa"
        self.password       = "aaaa"
        self.prefecture     = "aaaa"
        self.birthday       = "aaa"
        self.comment        = "aaaa"
        self.email          = "aa@a.mail"
        self.icon           = "aaa"
        self.status         = 0
        self.sex            = 0
    }
}

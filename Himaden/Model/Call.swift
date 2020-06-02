//
//  Call.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import Foundation
import RealmSwift

class Call: Object {
    
    @objc dynamic var callId: Int
    @objc dynamic var senderId: String
    @objc dynamic var receiverId: String
    @objc dynamic var senderName: String
    @objc dynamic var receiverName: String
    @objc dynamic var startTime: String
    @objc dynamic var endTime: String
    @objc dynamic var talkId: Int
    @objc dynamic var groupId: String
    @objc dynamic var status: Int
    
    required init() {
        callId = 1
        senderId = "aa"
        receiverId = "b"
        senderName = "aa"
        receiverName = "bb"
        startTime = "startTime"
        endTime = "endTime"
        talkId = 1
        groupId = "AAA"
        status = 1
    }
    
    convenience init (senderName: String, receiverName: String) {
        self.init()
        
        self.senderName = senderName
        self.receiverName = receiverName
    }
    
}

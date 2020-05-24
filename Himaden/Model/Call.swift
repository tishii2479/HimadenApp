//
//  Call.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import Foundation

struct Call {
    
    var callId: Int
    var senderId: String
    var receiverId: String
    var senderName: String
    var receiverName: String
    var startTime: Date
    var endTime: Date
    var talkId: Int
    var groupId: String?
    var status: Int
    var memberWithStatus: [[String : Int]]?
    
    init() {
        callId = 1
        senderId = "aa"
        receiverId = "b"
        senderName = "aa"
        receiverName = "bb"
        startTime = Date()
        endTime = Date()
        talkId = 1
        groupId = nil
        status = 1
        memberWithStatus = nil
    }
    
}

//
//  Call.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import Foundation
import RealmSwift
import FirebaseFirestore

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
    
    class func saveCallInformation(call: Call) {
        
        let data: [String: Any] = [
            "callId"        : call.callId,
            "senderId"      : call.senderId,
            "receiverId"    : call.receiverId,
            "senderName"    : call.senderName,
            "receiverName"  : call.receiverName,
            "startTime"     : call.startTime,
            "endTime"       : call.endTime,
            "talkId"        : call.talkId,
            "groupId"       : call.groupId,
            "status"        : call.status,
        ]
        
        // Add call to firebase
        Firestore.firestore().collection("calls").addDocument(data: data, completion: { (err) in
            // Error occured in saving a post to database
            if err != nil {
                print("[error] posting has occcured an error")
            } else {
                print("[debug] success")
            }
        })
        
        
    }
    
    
}

//
//  CallUtils.swift
//  Himaden
//
//  Created by Tatsuya Ishii on 2020/06/02.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import FirebaseFirestore
import RealmSwift

class CallUtils {
    
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

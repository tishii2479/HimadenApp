//
//  Post.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import Foundation
import RealmSwift
import FirebaseFirestore

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
    
    // MARK: Methods
    
    class func savePostInformation(text: String?, image: Image?) {
    
        guard text != nil || image != nil else {
            // Show user cant post without content
            return
        }
        
        let data: [String: Any] = [
            "postId"    : 0,
            "ownerId"   : 1,
            "ownerName" : "BBBB",
            "groupId"   : "",
            "mentionedFriends" : "",
            "text"      : text!,
            "image"     : "image",
            "postedAt"  : "2020/10/10",
        ]
        
        // Add post to firebase
        Firestore.firestore().collection("posts").addDocument(data: data, completion: { (err) in
            // Error occured in saving a post to database
            if err != nil {
                print("[error] posting has occcured an error")
            } else {
                print("[debug] success")
            }
        })
        
    }
}

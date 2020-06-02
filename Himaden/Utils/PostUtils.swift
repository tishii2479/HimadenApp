//
//  PostUtils.swift
//  Himaden
//
//  Created by Tatsuya Ishii on 2020/06/01.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import FirebaseFirestore
import RealmSwift

class PostUtils {
    
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

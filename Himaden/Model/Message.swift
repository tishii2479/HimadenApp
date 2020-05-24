//
//  Message.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

// This is for a test
import Foundation
import UIKit

struct Message {
    
    var talkId: Int
    var chatId: Int
    var senderType: SenderType = .send
    var text: String
    var image: Image
    var sender: Account
    var sendTime: Date
    
}

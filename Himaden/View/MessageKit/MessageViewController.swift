//
//  MessageViewController.swift
//  Himaden
//
//  Created by Tatsuya Ishii on 2020/06/01.
//  Copyright © 2020 tishii2479. All rights reserved.
//
//
//import UIKit
//import MessageKit
//import InputBarAccessoryView
//
//class MessageViewController: MessagesViewController {
//
//    private var messageList: [Message] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        messagesCollectionView.messagesDataSource = self
//        messagesCollectionView.messagesLayoutDelegate = self
//        messagesCollectionView.messagesDisplayDelegate = self
//        messagesCollectionView.messageCellDelegate = self
//        messageInputBar.delegate = self
//
//        // Do any additional setup after loading the view.
//    }
//
//}
//
//extension MessageViewController: MessagesDataSource {
//    func currentSender() -> SenderType {
//        return Sender(id: "123", displayName: "ME")
//    }
//
//    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
//        return .send
//    }
//
//    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
//        return 10
//    }
//
//}
//
//extension MessageViewController: MessagesDisplayDelegate {
//
//}
//
//extension MessageViewController: MessagesLayoutDelegate {
//
//}
//
//extension MessageViewController: MessageCellDelegate {
//
//}
//
//extension MessageViewController: InputBarAccessoryViewDelegate {
//
//}

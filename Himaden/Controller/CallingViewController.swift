//
//  CallingViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/22.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import SkyWay
import FirebaseFirestore

class CallingViewController: HMDViewController {
    
    private var dataConnection: SKWDataConnection?
    
    private let profileHeight: CGFloat  = 350
    private let btnDiameter: CGFloat    = 80
    
    private var messages = [Message]()
    
    private lazy var profileAtCallView: ProfileView = {
        let view = ProfileView(frame: CGRect(x: 0, y: statusBarHeight + navBarHeight, width: screenSize.width, height: profileHeight), vc: self)
        
        return view
    }()
    
    private lazy var messageToolBar: MessageToolBarView = MessageToolBarView(origin: CGPoint(x: 0, y: profileAtCallView.frame.maxY), vc: self)
    
    private lazy var messageTableView: MessageTableView = {
        let table = MessageTableView(frame: CGRect(x: 0, y: messageToolBar.frame.maxY, width: screenSize.width, height: screenSize.height - messageToolBar.frame.maxY))
        table.register(MessageTableViewCell.self, forCellReuseIdentifier: "Cell")
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    private lazy var searchFriendBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: Util.getMinXForCentering(width: 200), y: UIScreen.main.bounds.height / 2 + 40, width: 200, height: 40))
        button.backgroundColor = HMDColor.clear
        button.setTitle("いま暇な友達を探す", for: .normal)
        button.setTitleColor(HMDColor.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = HMDFont.middle
        button.addTarget(self, action: #selector(self.tapSearchFriend), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var lookBoardBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: Util.getMinXForCentering(width: 200), y: UIScreen.main.bounds.height / 2 + 100, width: 200, height: 40))
        button.backgroundColor = HMDColor.clear
        button.setTitle("みんなの投稿を見る", for: .normal)
        button.setTitleColor(HMDColor.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = HMDFont.middle
        button.addTarget(self, action: #selector(self.tapLookBoard), for: .touchUpInside)
        
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.height / 2 - 120, width: UIScreen.main.bounds.width, height: 20))
        label.backgroundColor = HMDColor.clear
        label.text = "まだ通話が始まっていません"
        label.textColor = HMDColor.black
        label.textAlignment = .center
        label.font = HMDFont.big
        
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationTitle(title: "通話")
        
        if AppUtils.nowCalling == false {
            self.setUpUIForCalling()
            self.setUpMessaging()
            
            if let _peer = SkywayUtils.peer {
                self.setupPeerCallbacks(peer: _peer)
            } else {
                print("Failed to create peer set up")
            }
        } else {
            self.setUpUIForStandby()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.dataConnection?.close()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setUpUIForStandby() {
        self.view.backgroundColor = HMDColor.white
        self.view.addSubview(titleLabel)
        self.view.addSubview(searchFriendBtn)
        self.view.addSubview(lookBoardBtn)
        
        profileAtCallView.removeFromSuperview()
        messageTableView.removeFromSuperview()
        messageToolBar.removeFromSuperview()
    }
    
    private func setUpUIForCalling() {
        self.view.backgroundColor = HMDColor.white
        self.view.addSubview(profileAtCallView)
        self.view.addSubview(messageTableView)
        self.view.addSubview(messageToolBar)
        
        profileAtCallView.setAccountInfoWhenCalling(account: Account())
        
        titleLabel.removeFromSuperview()
        searchFriendBtn.removeFromSuperview()
        lookBoardBtn.removeFromSuperview()
    }
    
    private func setUpMessaging() {
        let db = Firestore.firestore().collection("Talk")
        
    }
    
    @objc func tapEndCall() {
        print("Tap End Call")
        
        self.dataConnection?.close()
    }
    
    @objc func tapSend() {
        guard let text = self.messageToolBar.getContentOfTextField() else { return }
        if text == "" { return }

        self.messageToolBar.resetTextField()
        print("Send text: \(text)")

        self.view.endEditing(true)
        self.dataConnection?.send(text as NSObject)
        let message = Message(talkId: 0, chatId: 0, text: text, image: Image(), sender: Account(), sendTime: Date())
        self.messages.insert(message, at: 0)
        self.messageTableView.reloadData()
    }
    
    @objc func tapSearchFriend() {
        let friendListVC = self.tabBarController?.viewControllers?[1]
        self.tabBarController?.selectedViewController = friendListVC
    }
    
    @objc func tapLookBoard() {
        let boardVC = self.tabBarController?.viewControllers?[2]
        self.tabBarController?.selectedViewController = boardVC
    }

}

// MARK: skyway functions

extension CallingViewController {
    
    func connect(targetPeerId: String) {
        let options = SKWConnectOption()
        options.serialization = SKWSerializationEnum.SERIALIZATION_BINARY
        
        if let dataConnection = SkywayUtils.peer?.connect(withId: targetPeerId, options: options) {
            self.dataConnection = dataConnection
            self.setupDataConnectionCallbacks(dataConnection: dataConnection)
        } else {
            print("Failed to connect data connection")
        }
    }
    
}

// MARK: skyway callbacks

extension CallingViewController {
    
    func setupPeerCallbacks(peer: SKWPeer) {
        
        // MARK: PEER_EVENT_ERROR
        peer.on(SKWPeerEventEnum.PEER_EVENT_ERROR, callback: { (obj) -> Void in
            if let error = obj as? SKWPeerError {
                print("\(error)")
            }
        })
        
        // MARK: PEER_EVENT_OPEN
        peer.on(SKWPeerEventEnum.PEER_EVENT_OPEN, callback: { (obj) -> Void in
            if let peerId = obj as? String {
                print("Your PeerId: \(peerId)")
            }
        })
        
        // MARK: PEER_EVENT_CONNECTION
        peer.on(SKWPeerEventEnum.PEER_EVENT_CALL, callback: { (obj) -> Void in
            if let connection = obj as? SKWDataConnection {
                self.dataConnection = connection
                self.setupDataConnectionCallbacks(dataConnection: connection)
            }
        })
        
    }
    
    func setupDataConnectionCallbacks(dataConnection: SKWDataConnection) {
        
        // MARK: DATACONNECTION_EVENT_OPEN
        dataConnection.on(SKWDataConnectionEventEnum.DATACONNECTION_EVENT_OPEN, callback: { (obj) -> Void in
            if let dataConnection = obj as? SKWDataConnection {
                print("Target Peer Id: \(dataConnection)")
            }
           
        })
        
        // MARK: DATACONNECTION_EVENT_DATA
        dataConnection.on(SKWDataConnectionEventEnum.DATACONNECTION_EVENT_DATA, callback: { (obj) -> Void in
            let strValue: String = obj as! String
            print("Get data: \(strValue)")
            let message = Message(talkId: 1, chatId: 1, text: "AA", image: Image(), sender: Account(), sendTime: Date())
            self.messages.insert(message, at: 0)
            self.messageTableView.reloadData()
        })
        
        // MARK: MEDIACONNECTION_EVENT_CLOSE
        dataConnection.on(SKWDataConnectionEventEnum.DATACONNECTION_EVENT_DATA, callback: { (obj) -> Void in
            print("Close data connection")
            self.dataConnection = nil
        })
    }
    
}


// MARK: UITableViewDelegate UITableViewDataSource

extension CallingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MessageTableViewCell

        cell.setUpComponents(message: messages[indexPath.row])
        return cell
    }
}

// MARK: UITextFieldDelegate

extension CallingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}

//
//  SkywayUtils.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/25.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import SkyWay

class SkywayUtils {
    static var peer: SKWPeer?
    
    class func setUpSkyway() {
        
        guard let apikey = (UIApplication.shared.delegate as? AppDelegate)?.skyWayAPIKey, let domain = (UIApplication.shared.delegate as? AppDelegate)?.skyWayDomain else {
            print("Not set apikey or domain")
            return
        }
        
        let option: SKWPeerOption = SKWPeerOption.init()
        option.key = apikey
        option.domain = domain
        
        peer = SKWPeer(options: option)
        
    }
    
    class func loadConnectedPeerId(peer: SKWPeer, myPeerId: String?, handler: @escaping (_ peerIds: [String]?) -> Void) {
        peer.listAllPeers({ (peers) -> Void in
            if let connectedPeerIds = peers as? [String] {
                let res = connectedPeerIds.filter({( connectedPeerId ) -> Bool in
                    return connectedPeerId != myPeerId
                })
                handler(res)
            } else {
                handler(nil)
            }
        })
    }
    
}

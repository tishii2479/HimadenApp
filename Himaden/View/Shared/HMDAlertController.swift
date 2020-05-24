//
//  HMDAlertController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/25.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class HMDAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension HMDAlertController {
    
    class func oneButton(vc: UIViewController, _ title: String, message: String, btnOk: String = "OK", handler: ((UIAlertAction?) -> Void)?) {
        let alert = self.init(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: btnOk, style: .default, handler: handler)
        
        alert.addAction(okAction)
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    class func showSelectPeerIdDialog(vc: UIViewController, peerIds: [String], handler: @escaping (_ peerId: String) -> Void) {
        let alert = self.init(title: "接続中のPeerId", message: "接続先を選択してください", preferredStyle: .alert)
        
        for peerId in peerIds {
            let peerIdAction = UIAlertAction(title: peerId, style: .default, handler: { (alert) in
                handler(peerId)
            })
            alert.addAction(peerIdAction)
        }
        
        let noAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alert.addAction(noAction)
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    class func twoButton(vc: UIViewController, _ title: String, message: String, btnOk: String = "はい", btnNo: String = "いいえ", okHandler: ((UIAlertAction?) -> Void)?, noHandler: ((UIAlertAction?) -> Void)?) {
        let alert = self.init(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: btnOk, style: .default, handler: okHandler)
        let noAction = UIAlertAction(title: btnNo, style: .cancel, handler: noHandler)
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        
        vc.present(alert, animated: true, completion: nil)
    }
}

//
//  MessageToolBar.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class MessageToolBarView: UIView {

    private let paddingX: CGFloat       = 10
    private let paddingY: CGFloat       = 5
    private let sendBtnWidth: CGFloat   = 50
    private let toolBarHeight: CGFloat  = 44
    private var vc: UIViewController!
    
    private lazy var sendBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - sendBtnWidth - paddingX, y: paddingY, width: sendBtnWidth, height: toolBarHeight - paddingY * 2))
        btn.layer.backgroundColor = HMDColor.white.cgColor
        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        btn.setImage(UIImage(named: "send"), for: .normal)
        btn.layer.cornerRadius  = 5

        return btn
    }()
    
    private lazy var textField: UITextField = {
        let field = HMDTextField(frame: CGRect(x: paddingX, y: paddingY, width: UIScreen.main.bounds.width - sendBtnWidth - paddingX * 3, height: toolBarHeight - paddingY * 2))
        field.backgroundColor       = HMDColor.white
        field.layer.cornerRadius    = field.frame.height / 2
        field.placeholder           = "文章を入力…"
        field.font                  = HMDFont.middle
        
        return field
    }()
    
    init(origin: CGPoint, vc: UIViewController) {
        super.init(frame: CGRect(origin: origin, size: CGSize(width: UIScreen.main.bounds.width, height: toolBarHeight)))
        self.vc = vc
        
        self.backgroundColor = HMDColor.orange
        
        self.addSubview(sendBtn)
        self.addSubview(textField)
        
        if let cvc = vc as? CallingViewController {
            sendBtn.addTarget(cvc, action: #selector(cvc.tapSend), for: .touchUpInside)
        } else {
            print("[debug] ViewController not found: \(vc)")
        }
    }
    
    func getContentOfTextField() -> String? {
        return textField.text
    }
    
    func resetTextField() {
        textField.text = nil
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

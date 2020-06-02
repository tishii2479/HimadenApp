//
//  LoginAccountTile.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/06.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class LoginAccountTile: UIView {

    private let width: CGFloat = 300
    private let height: CGFloat = 400
    private var vc: LoginViewController!
    
    private var loginBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: 50, y: 320, width: 200, height: 50))
        button.backgroundColor = HMDColor.orange
        button.setTitle("ログイン", for: .normal)
        button.setTitleColor(HMDColor.white, for: .normal)
        
        return button
    }()
    private var idOrEmailField: StartTextField = {
        let field = StartTextField(frame: CGRect(x: 30, y: 80, width: 240, height: 50))
        field.setPlaceHolder(text: "ユーザーIDかメールアドレス")
        
        return field
    }()
    private var passwordField: StartTextField = {
        let field = StartTextField(frame: CGRect(x: 30, y: 180, width: 240, height: 50))
        field.setPlaceHolder(text: "パスワード")
        field.isSecureTextEntry = true
        
        return field
    }()
    private var errorLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 20, width: 240, height: 40))
        label.backgroundColor = HMDColor.clear
        label.textColor = HMDColor.orange
        label.font  = HMDFont.middle
        label.textAlignment = .center
        label.numberOfLines = 0
        label.alpha = 0
        
        return label
    }()

    init(vc: LoginViewController) {
        super.init(frame: CGRect(x: Util.getMinXForCentering(width: width), y: (UIScreen.main.bounds.height - height) / 2, width: width, height: height))
        self.vc = vc
        self.backgroundColor = HMDColor.white
        self.backgroundColor = .white
        self.layer.cornerRadius   = 15
        self.layer.shadowColor    = UIColor.black.cgColor
        self.layer.shadowOffset   = CGSize(width: 0, height: 4.0)
        self.layer.shadowRadius   = 15
        self.layer.shadowOpacity  = 0.6
        
        self.addSubview(loginBtn)
        self.addSubview(idOrEmailField)
        self.addSubview(passwordField)
        self.addSubview(errorLabel)
        
        loginBtn.addTarget(self.vc, action: #selector(self.vc.tapLoginBtn), for: .touchUpInside)
    }
    
    func getUserInput() -> [String : String?] {
        return [
            "email" : idOrEmailField.text,
            "password" : passwordField.text
        ]
    }
    
    func setErrorText(text: String) {
        self.errorLabel.text = text
        self.errorLabel.alpha = 1
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

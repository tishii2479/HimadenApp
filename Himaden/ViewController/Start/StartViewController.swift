//
//  LoginViewController.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/26.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    private lazy var startButton: StartRoundedButton = StartRoundedButton(frame: CGRect(x: Util.getMinXForCentering(width: 300), y: -100, width: 300, height: 50), text: "始める")
    private lazy var loginButton: StartBottomTextButton = StartBottomTextButton(text: "アカウントをお持ちの方はこちら")
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2)
        view.backgroundColor = HMDColor.white
        
        let whiteLayer = CAShapeLayer()
        whiteLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120)
        whiteLayer.fillColor = HMDColor.orange.cgColor
        
        let whiteLine = UIBezierPath()
        whiteLine.move(to: CGPoint(x: 0, y: 0))
        whiteLine.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 120))
        whiteLine.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
        
        whiteLayer.path = whiteLine.cgPath
        
        view.layer.addSublayer(whiteLayer)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        self.addTargetOfButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.startButton.alpha = 1
        self.startButton.frame.origin.y = -100
        self.whiteView.frame.origin.y = UIScreen.main.bounds.height
        self.loginButton.alpha = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1, animations: {
            self.startButton.center.y = UIScreen.main.bounds.height / 2 + 60
            self.whiteView.frame.origin.y = UIScreen.main.bounds.height / 2
        })
    }
    
    func setUpUI() {
        self.view.backgroundColor   = HMDColor.orange
        
        self.view.addSubview(whiteView)
        self.view.addSubview(startButton)
        self.view.addSubview(loginButton)
    }
    
    func addTargetOfButtons() {
        startButton.addTarget(self, action: #selector(self.tapStart), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(self.tapLogin), for: .touchUpInside)
    }
    
    @objc func tapStart() {
        UIView.animateKeyframes(withDuration: 1, delay: 0.5, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                self.whiteView.frame.origin.y = -1 * UIScreen.main.bounds.height / 2
                self.startButton.alpha = 0
                self.loginButton.alpha = 0
            })
        }, completion: { (result) in
            print(result)
            if result {
                let nextVC = CreateAccountViewController()
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: false, completion: nil)
            } else {
                print("Transition failed")
            }
        })
    }
    
    @objc func tapLogin() {
        UIView.animateKeyframes(withDuration: 1, delay: 0.5, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                self.whiteView.frame.origin.y = -1 * UIScreen.main.bounds.height / 2
                self.startButton.alpha = 0
                self.loginButton.alpha = 0
            })
        }, completion: { (result) in
            if result {
                let loginVC = LoginViewController()
                loginVC.modalPresentationStyle = .fullScreen
                self.present(loginVC, animated: false, completion: nil)
            } else {
                print("Transition failed")
            }
        })
    }
    
}

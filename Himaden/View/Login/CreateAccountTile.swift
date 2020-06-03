//
//  CreateAccountTile.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/03.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class CreateAccountTile: UIView {
    
    private let width: CGFloat = 300
    private let height: CGFloat = 350
    private var vc: CreateAccountViewController!
    private var item: Account.Item!
    
    private lazy var nextBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: 50, y: 270, width: 200, height: 50))
        button.backgroundColor = HMDColor.orange
        button.setTitle("次へ", for: .normal)
        button.setTitleColor(HMDColor.white, for: .normal)
        
        return button
    }()
    
    private lazy var topLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 20, width: width, height: 20))
        label.textColor = HMDColor.orange
        label.font = HMDFont.middle
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 160, width: width - 10 * 2, height: 40))
        label.textColor = HMDColor.orange
        label.font = HMDFont.little
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var textField: StartTextField = StartTextField(frame: CGRect(x: 30, y: 100, width: 240, height: 50))
    
    private lazy var birthdayPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.locale = Locale.current
        picker.timeZone = NSTimeZone.local
        picker.addTarget(self.vc, action: #selector(vc.birthdayPickerValueChange(_:)), for: .valueChanged)
        
        return picker
    }()
    
    private lazy var prefecturePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        return picker
    }()
    
    private lazy var sexPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        return picker
    }()

    init(vc: CreateAccountViewController) {
        super.init(frame: CGRect(x: Util.getMinXForCentering(width: width), y: UIScreen.main.bounds.height, width: width, height: height))
        self.vc = vc
        self.backgroundColor = .white
        self.layer.cornerRadius   = 15
        self.layer.shadowColor    = UIColor.black.cgColor
        self.layer.shadowOffset   = CGSize(width: 0, height: 4.0)
        self.layer.shadowRadius   = 15
        self.layer.shadowOpacity  = 0.6
        
        nextBtn.addTarget(vc, action: #selector(vc.tapNext), for: .touchUpInside)
        self.addSubview(textField)
        self.addSubview(nextBtn)
        self.addSubview(topLabel)
        self.addSubview(errorLabel)
    }
    
    func setPlaceHolder(text: String) {
        self.textField.setPlaceHolder(text: text)
    }
    
    func setInputView(item: Account.Item) {
        self.item = item
        switch item {
        case .prefecture:
            self.textField.inputView = prefecturePicker
        case .birthday:
            self.textField.inputView = birthdayPicker
        case .sex:
            self.textField.inputView = sexPicker
        case .email:
            self.textField.inputView = nil
            self.textField.keyboardType = .emailAddress
        case .password:
            self.textField.inputView = nil
            self.textField.isSecureTextEntry = true
        default:
            self.textField.inputView = nil
            self.textField.keyboardType = .alphabet
        }
    }
    
    func getInput() -> Any {
        return self.textField.text ?? ""
    }
    
    func setFieldText(text: String) {
        self.textField.text = text
    }
    
    func setTopLabelText(text: String) {
        self.topLabel.text = text
    }
    
    func setErrorLabel(text: String) {
        self.errorLabel.text = text
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension CreateAccountTile: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if item == .prefecture {
            return Account.prefectures.count
        } else {
            return Account.sex.count
        }
    } 
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if item == .prefecture {
            return Account.prefectures[row]
        } else {
            return Account.sex[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if item == .prefecture {
            self.textField.text = Account.prefectures[row]
        } else {
            self.textField.text = Account.sex[row]
        }
    }
}

//
//  AccountUtils.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/30.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import FirebaseFirestore
import RealmSwift

class AccountUtils {
    
    // MARK: Properties
    struct Info {
        var title: String
        var placeHolder: String
    }
    
    enum Item: Int {
        case prefecture
        case birthday
        case sex
        case email
        case name
        case userId
        case password
    }
    
    static let paramName: [Item : String] = [
        .prefecture     : "prefecture",
        .birthday       : "birthday",
        .sex            : "sex",
        .email          : "email",
        .name           : "user_name",
        .userId         : "user_id",
        .password       : "password",
    ]
    
    static let itemInfo: [Item : Info] = [
        .prefecture     : Info(title: "都道府県",
                               placeHolder: "都道府県を選択"),
        .birthday       : Info(title: "誕生日",
                               placeHolder: "誕生日を選択"),
        .sex            : Info(title: "性別",
                               placeHolder: "性別を入力"),
        .email          : Info(title: "メールアドレス",
                               placeHolder: "メールアドレスを入力"),
        .name           : Info(title: "ユーザー名",
                               placeHolder: "ユーザー名を入力"),
        .userId         : Info(title: "ユーザID",
                               placeHolder: "ユーザIDの入力"),
        .password       : Info(title: "パスワード",
                           placeHolder:  "パスワードの入力"),
    ]
    
    static let prefectures = ["北海道", "青森県", "岩手県", "宮城県", "秋田県",
    "山形県", "福島県", "茨城県", "栃木県", "群馬県",
    "埼玉県", "千葉県", "東京都", "神奈川県","新潟県",
    "富山県", "石川県", "福井県", "山梨県", "長野県",
    "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県",
    "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県",
    "鳥取県", "島根県", "岡山県", "広島県", "山口県",
    "徳島県", "香川県", "愛媛県", "高知県", "福岡県",
    "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県",
    "鹿児島県", "沖縄県"]
    
    static let sex = ["男性", "女性", "その他"]
    
    // MARK: Methods
    class func saveUserAccountInformation(userId: String) {
        let accounts = Firestore.firestore().collection("accounts")
        
        accounts.document(userId).getDocument(completion: { (document, error) in
            if let document = document, document.exists {
                if let data: [String: Any] = document.data() {
                    // Set data to realm
                        
                    let account = Account(data: data)
                    
                    let realm = try! Realm()

                    try! realm.write {
                        realm.add(account)
                    }
                    
                    print("Written account data to realm, Data: \(data)")
                } else {
                    print("[error] data does not exist")
                }
            } else {
                print("[error] document does not exist")
            }
        })
    }

}


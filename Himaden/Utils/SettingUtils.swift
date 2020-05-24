//
//  SettingUtils.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/26.
//  Copyright © 2020 tishii2479. All rights reserved.
//

class SettingUtils {
    
    static let settingGroups: [String : [[String]]] = [
        "aaa"               : [["ccc", "ddd"]],
        "bbb"               : [["ccc", "ddd"]],
        "FriendSetting"     : [["report"], ["block"], ["mute"], ["reduceAppearance"], ["inviteToGroup"], ["addToParty"]]
    ]
    
    static let settingItems: [String : Setting] = [
        "aaa"               : Setting(name: "Aaa"),
        "bbb"               : Setting(name: "Bbb"),
        "ccc"               : Setting(name: "CCC"),
        "ddd"               : Setting(name: "DDD"),
        "report"            : Setting(name: "報告する"),
        "block"             : Setting(name: "ブロックする"),
        "mute"              : Setting(name: "ミュート"),
        "reduceAppearance"  : Setting(name: "表示回数を減らす"),
        "inviteToGroup"     : Setting(name: "グループに招待"),
        "addToParty"        : Setting(name: "パーティに追加"),
    ]
    
    class func getSettingFromName(name: String) -> Setting {
        if let item = settingItems[name] {
            return item
        } else {
            print("[error] settingItem is not found, name is invalid")
            return Setting(name: "error")
        }
    }
    
    class func getSettingGroupFromParentName(name: String) -> [[String]] {
        if let group = settingGroups[name] {
            return group
        } else {
            print("[error] settingGroup is not found, name is invalid")
            return [["aaa"]]
        }
    }
    
}

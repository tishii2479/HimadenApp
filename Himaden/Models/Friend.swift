//
//  Friend.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/07.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import Foundation

@objc protocol Friend {
    @objc dynamic var id: String { get set }
    @objc dynamic var name: String { get set }
    @objc dynamic var icon: String { get set }
    @objc dynamic var comment: String { get set }
    @objc dynamic var status: Int { get set }
}

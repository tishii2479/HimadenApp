//
//  Friend.swift
//  Himaden
//
//  Created by tishii2479 on 2020/05/07.
//  Copyright © 2020 tishii2479. All rights reserved.
//

protocol Friend {
    var id: String { get set }
    var name: String { get set }
    var icon: Image { get set }
    var comment: String { get set }
    var status: Status { get set }
}

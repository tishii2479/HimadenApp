//
//  HMDColor.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/24.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit

class HMDColor: UIColor {
    
    class override var clear: UIColor {
        return UIColor.clear
    }
    
    class override var lightGray: UIColor {
        return UIColor(hex: "EEEEEE")
    }
    
    class override var black: UIColor {
        return UIColor(hex: "000000")
    }
    
    class override var white: UIColor {
        return UIColor(hex: "FFFFFF")
    }
    
    class override var gray: UIColor {
        return UIColor(hex: "555555")
    }
    
    class override var orange: UIColor {
        return UIColor(hex: "F39800")
    }
    
    class var lightOrange: UIColor {
        return UIColor(hex: "F39800", alpha: 0.3)
    }
    
    class var lightBlack: UIColor {
        return UIColor(hex: "555555")
    }
    
    class var online: UIColor {
        return UIColor(hex: "FF0000")
    }
    
    class var offline: UIColor {
        return UIColor(hex: "0000FF")
    }
    
}

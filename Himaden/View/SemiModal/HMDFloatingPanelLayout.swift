//
//  HMDFloatingPanelLayout.swift
//  Himaden
//
//  Created by tishii2479 on 2020/04/28.
//  Copyright © 2020 tishii2479. All rights reserved.
//

import UIKit
import FloatingPanel

class HMDFloatingPanelLayout: FloatingPanelLayout {
    
    private var height: CGFloat!
    private let safeAreaHeight: CGFloat = 30
    private let closeButtonHeight: CGFloat = 50
    private let marginBottom: CGFloat = 20
    
    init(columnCount: Int) {
        height = CGFloat(columnCount * 60) + safeAreaHeight + closeButtonHeight + marginBottom
    }
    
    var initialPosition: FloatingPanelPosition {
        return .half
    }
    
    var supportedPositions: Set<FloatingPanelPosition> {
        return [.half, .tip]
    }
    
    func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        switch position {
        case .half: return height
        case .tip: return -100
        default: return nil
        }
    }
    
    func backdropAlphaFor(position: FloatingPanelPosition) -> CGFloat {
        return 0.0
    }
    
}

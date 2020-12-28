//
//  RelativeDimension.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/27/20.
//

import UIKit

class Constants {
    // UIEdgeInsets(top: 47.0, left: 0.0, bottom: 34.0, right: 0.0)
    
    static let baseWidth: CGFloat = 390
    static let baseHeight: CGFloat = 844
    
    static let topInset = UIApplication.shared.windows[0].safeAreaInsets.top
    static let bottomInset = UIApplication.shared.windows[0].safeAreaInsets.bottom
    
    static var widthRatio: CGFloat {
        return UIScreen.main.bounds.width/baseWidth
    }
    
    static var heightRatio: CGFloat {
        return UIScreen.main.bounds.height/baseHeight
    }
}

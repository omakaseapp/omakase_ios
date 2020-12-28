//
//  UIColor+Extensions.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/27/20.
//

import UIKit

extension UIColor {
    convenience init(hex: Int) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 256.0,
            green: CGFloat((hex >> 8) & 0xFF) / 256.0,
            blue: CGFloat(hex & 0xFF) / 256.0,
            alpha: 1
        )
    }
    
    static var omakaseBeige = UIColor(hex: 0xE9DAB3)
    static var omakaseLightGray = UIColor(hex: 0xEFEFEF)
    static var omakaseGray = UIColor(hex: 0xBAB9B9)
    static var omakaseDarkGray = UIColor(hex: 0x6B6B6B)
    static var omakaseSalmon = UIColor(hex: 0xFFAF9F)
    static var omakaseBlack = UIColor(hex: 0x262626)
    static var hyperlinkBlue = UIColor(hex: 0x64B2F9)
    
    func image() -> UIImage {
        let size = CGSize(width: 1, height: 1)
        return UIGraphicsImageRenderer(size: size).image { context in
            self.setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }
    }
}

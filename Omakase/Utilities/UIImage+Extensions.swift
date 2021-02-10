//
//  UIImage+Extensions.swift
//  Omakase
//
//  Created by Hanzheng Li on 2/10/21.
//

import UIKit

extension UIImage {
    func scaled(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return scaledImage.withRenderingMode(.alwaysOriginal)
    }
    
    func blurred() -> UIImage? {
        if let ciImg = CIImage(image: self) {
            ciImg.applyingFilter("CIGaussianBlur")
            return UIImage(ciImage: ciImg)
        }
        return nil
    }
}


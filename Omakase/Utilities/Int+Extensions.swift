//
//  Int+Extensions.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/27/20.
//

import UIKit

extension Int {
    var adjustedHeight: CGFloat {
        return CGFloat(self) * Constants.heightRatio
    }
    
    var adjustedWidth: CGFloat {
        return CGFloat(self) * Constants.heightRatio
    }
    
    var adjustedTopOffset: CGFloat {
        return self.adjustedHeight - Constants.topInset
    }
}

//
//  CGFloat+Extensions.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/27/20.
//

import UIKit

extension CGFloat {
    var adjustedHeight: CGFloat {
        return self * Constants.heightRatio
    }
    
    var adjustedWidth: CGFloat {
        return self * Constants.heightRatio
    }
    
    var adjustedTopOffset: CGFloat {
        return self.adjustedHeight - Constants.topInset
    }
}

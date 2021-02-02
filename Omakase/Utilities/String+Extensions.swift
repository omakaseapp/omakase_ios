//
//  String+Extensions.swift
//  Omakase
//
//  Created by Hanzheng Li on 2/1/21.
//

import Foundation

extension String {
    init(time: TimeInterval) {
        let seconds = Int(time)
        self.init(format: "%01i:%02i", seconds / 60 % 60, seconds % 60)
    }
}

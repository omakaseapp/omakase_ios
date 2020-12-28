//
//  RectangleButton.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/27/20.
//

import UIKit

class RectangleButton: UIButton {
    
    // MARK: Vars & Constants
    private var completion: (() -> ())?
    
    // MARK: Init & Layout
    
    init(title: String, color: UIColor, fontSize: CGFloat, completion: (() -> ())?) {
        self.completion = completion
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.karlaBold.withSize(fontSize)
        setBackgroundImage(color.image(), for: .normal)
        layer.cornerRadius = 8.adjustedHeight
        clipsToBounds = true
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    @objc private func buttonPressed() {
        completion?()
    }
}

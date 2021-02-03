//
//  otpTextField.swift
//  Omakase
//
//  Created by Hanzheng Li on 2/2/21.
//

import UIKit

class OTPTextField: UIView {
    
    /*
     Recommended height 55, width 300
     */

    // MARK: Subviews
    
    private class singleCharTextField: UITextField {
        
        var prevBox: singleCharTextField?
        var nextBox: singleCharTextField?
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            layer.borderWidth = 4.adjustedHeight
            layer.borderColor = UIColor.omakaseBeige.cgColor
            layer.cornerRadius = 8.adjustedHeight
            textAlignment = .center
            contentVerticalAlignment = .center
            contentHorizontalAlignment = .center
            isUserInteractionEnabled = true
            keyboardType = .numberPad
            textContentType = .oneTimeCode
            addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        @objc func editingChanged() {
            let text = self.text ?? ""
            if text.count > 1 {
                self.text = String(text.prefix(1))
                nextBox?.text = String(text.dropFirst())
                _ = nextBox?.becomeFirstResponder()
                _ = nextBox?.editingChanged()
            }
            if text.count == 1 {
                _ = nextBox?.becomeFirstResponder()
            }
            if text.count == 0 {
                _ = prevBox?.becomeFirstResponder()
            } else { }
        }

    }
    
    private lazy var box1: singleCharTextField = singleCharTextField()
    private lazy var box2: singleCharTextField = singleCharTextField()
    private lazy var box3: singleCharTextField = singleCharTextField()
    private lazy var box4: singleCharTextField = singleCharTextField()
    
    // MARK: Init & Layout
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let boxes = [ box1, box2, box3, box4 ]
        for box in boxes { addSubview(box) }
        setConstraints()
        box1.nextBox = box2
        box2.prevBox = box1
        box2.nextBox = box3
        box3.prevBox = box2
        box3.nextBox = box4
        box4.prevBox = box3
    }
    
    private func setConstraints() {
        let boxHeight = 55.adjustedHeight
        let boxWidth = 60.adjustedWidth
        box1.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
            make.height.equalTo(boxHeight)
            make.width.equalTo(boxWidth)
        }
        box2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(boxHeight)
            make.width.equalTo(boxWidth)
            make.leading.equalToSuperview().offset(82.adjustedWidth)
        }
        box3.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(boxHeight)
            make.width.equalTo(boxWidth)
            make.trailing.equalToSuperview().inset(82.adjustedWidth)
        }
        box4.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
            make.height.equalTo(boxHeight)
            make.width.equalTo(boxWidth)
        }
    } 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Actions
    
    public override func becomeFirstResponder() -> Bool {
        box1.becomeFirstResponder()
        return true
    }
}

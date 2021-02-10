//
//  OTPViewController.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/28/20.
//

import UIKit

class OTPViewController: UIViewController {
    
    // MARK: Subviews
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()

        let attributedString = NSMutableAttributedString(string: "We sent a\nverification\ncode to\n\(phoneNumber).")
        attributedString.addAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.omakaseBlack,
            NSAttributedString.Key.font: UIFont.karlaBold.withSize(36.adjustedHeight)
        ], range: NSMakeRange(0, 30))
        
        attributedString.addAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.omakaseSalmon,
            NSAttributedString.Key.font: UIFont.karlaBold.withSize(36.adjustedHeight),
        ], range: NSMakeRange(30, 14))
        
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var resendCodeButton: RectangleButton = {
        let button = RectangleButton(title: "resend code", color: UIColor.init(hex: 0xFF6C4A), fontSize: 17, completion: resendCodeButtonPressed)
        button.setBackgroundImage(UIColor.omakaseGray.image(), for: .disabled)
        
        return button
    }()
    
    private lazy var otpTextField: OTPTextField = {
        let textField = OTPTextField()
        return textField
    }()
    
    private lazy var codeExpirationCountdownLabel: UILabel = {
        let label = UILabel()
        
        label.text = String(time: timerCounter)
        label.font = UIFont.karlaBold.withSize(28.adjustedHeight)
        label.textColor = .omakaseSalmon
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: Variables & Constants
    
    private var phoneNumber: String
    private var timerCounter: TimeInterval = 10
    private var otpExpirationTimer: Timer!
    
    // MARK: Init & Layout
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        let subviews = [
            titleLabel,
            resendCodeButton,
            otpTextField,
            codeExpirationCountdownLabel
        ]
        for subview in subviews { view.addSubview(subview) }
        
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resendCodeButtonPressed()
        _ = otpTextField.becomeFirstResponder()
    }
    
    private func setConstraints() {
        let leadingOffset: CGFloat = 39.adjustedWidth
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(92.adjustedTopOffset)
            make.leading.trailing.equalToSuperview().inset(leadingOffset)
        }
        resendCodeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(287.adjustedTopOffset)
            make.leading.equalToSuperview().offset(leadingOffset)
            make.height.equalTo(42.adjustedHeight)
            make.width.equalTo(142.adjustedWidth)
        }
        otpTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(leadingOffset)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(366.adjustedTopOffset)
            make.height.equalTo(55.adjustedHeight)
        }
        codeExpirationCountdownLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(447.adjustedTopOffset)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    
    private func resendCodeButtonPressed() {
        timerCounter = 10
        codeExpirationCountdownLabel.text = String(time: timerCounter)
        codeExpirationCountdownLabel.font = UIFont.karlaBold.withSize(28.adjustedHeight)
        codeExpirationCountdownLabel.textColor = .omakaseSalmon
        resendCodeButton.isEnabled = false
        otpExpirationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc private func decrementCounter() {
        if timerCounter > 0 {
            timerCounter -= 1
            codeExpirationCountdownLabel.text = String(time: timerCounter)
        } else {
            otpExpirationTimer.invalidate()
            codeExpirationCountdownLabel.font = UIFont.karlaBold.withSize(18.adjustedHeight)
            codeExpirationCountdownLabel.textColor = .omakaseBlack
            codeExpirationCountdownLabel.text = "code expired.\npress resend to try again."
            resendCodeButton.isEnabled = true
        }
    }
}

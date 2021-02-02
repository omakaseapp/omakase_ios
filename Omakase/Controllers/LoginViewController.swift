//
//  ViewController.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/27/20.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextViewDelegate {
    
    enum Config {
        case signup, login
    }
    
    // MARK: Subviews
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = config == .signup ? "Sign Up" : "Log In"
        label.font = UIFont.karlaBold.withSize(28.adjustedHeight)
        label.textColor = UIColor.omakaseBlack
        label.textAlignment = .left
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "let's get you eating, asap."
        label.font = UIFont.karlaBold.withSize(17.adjustedHeight)
        label.textColor = UIColor.omakaseGray
        label.textAlignment = .left
        return label
    }()
    
    private lazy var phoneField: LoginTextField = {
        return LoginTextField(config: .phone)
    }()
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.font = UIFont.karlaBold.withSize(17.adjustedHeight)
        label.textColor = UIColor.omakaseSalmon
        label.textAlignment = .center
        return label
    }()
    
    private lazy var emailField: LoginTextField = {
        return LoginTextField(config: .email)
    }()
    
    private lazy var signupButton: RectangleButton = {
        let buttonTitle = config == .signup ? "Sign Up" : "Log In"
        let button = RectangleButton(title: buttonTitle, color: .omakaseBeige, fontSize: 17.adjustedHeight) {
            self.signupButtonPressed()
        }
        return button
    }()
    
    private lazy var loginTextView: UITextView = {
        let textView = UITextView()
        textView.delegate = self
        textView.backgroundColor = .clear
        textView.textAlignment = .center
        textView.isEditable = false
//        textView.isSelectable = false
        
        let linkRange = NSRange(location: 17, length: config == .signup ? 6 : 7)
        let attributedString = NSMutableAttributedString(string: "\(config == .signup ? "Have" : "Need") an account? \(config == .signup ? "Log In" : "Sign Up")")
        let pstyle = NSMutableParagraphStyle()
        pstyle.alignment = .center
        attributedString.addAttribute(.link, value: "omakase://iosapp/onboarding/", range: linkRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor.omakaseBlack, range: NSRange(location:0, length: 17))
        attributedString.addAttribute(.foregroundColor, value: UIColor.hyperlinkBlue, range: linkRange)
        attributedString.addAttribute(.font, value: UIFont.karlaBold.withSize(15.adjustedHeight), range: NSRange(location: 0, length: config == .signup ? 23 : 24))
        attributedString.addAttribute(.paragraphStyle, value: pstyle, range: NSRange(location: 0, length: config == .signup ? 23 : 24))
        
        textView.attributedText = attributedString
        return textView
    }()
    
    // MARK: Init & Layout
    
    private var config: Config
    
    init(with config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        let subviews = [
            titleLabel,
            subtitleLabel,
            phoneField,
            orLabel,
            emailField,
            signupButton,
            loginTextView
        ]
        for subview in subviews {
            view.addSubview(subview)
        }
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        phoneField.becomeFirstResponder()
    }
    
    private func setConstraints() {
        let leadingOffset: CGFloat = 45.adjustedWidth
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(130.adjustedTopOffset)
            make.leading.equalToSuperview().offset(leadingOffset)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(43.adjustedHeight)
            make.leading.equalToSuperview().offset(leadingOffset)
        }
        phoneField.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel).offset(53.adjustedHeight)
            make.centerX.equalToSuperview()
            make.height.equalTo(50.adjustedHeight)
            make.width.equalTo(300.adjustedWidth)
        }
        orLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(phoneField).offset(58.adjustedHeight)
        }
        emailField.snp.makeConstraints { make in
            make.top.equalTo(orLabel).offset(26.adjustedHeight)
            make.centerX.equalToSuperview()
            make.height.equalTo(50.adjustedHeight)
            make.width.equalTo(300.adjustedWidth)
        }
        signupButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailField).offset(78.adjustedHeight)
            make.height.equalTo(50.adjustedHeight)
            make.width.equalTo(300.adjustedWidth)
        }
        loginTextView.snp.makeConstraints { make in
            make.top.equalTo(signupButton).offset(66.adjustedHeight)
            make.width.equalToSuperview()
            make.height.equalTo(50.adjustedHeight)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: Actions
    private func signupButtonPressed() {
        navigationController?.pushViewController(OTPViewController(phoneNumber: "123-444-5555"), animated: true)
    }
    
    private func loginAttributedTextPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: UITextViewDelegate
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        guard let components = NSURLComponents(url: URL, resolvingAgainstBaseURL: true),
              let path = components.path,
              components.host == "iosapp",
              components.scheme == "omakase" else {
            return false
        }

        switch path {
        case "/onboarding/":
            print("path pressed: \(path)")
            loginAttributedTextPressed()
            return true
        default:
            print("invalid path: \(path)")
        }
        return false
    }
}


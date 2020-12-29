//
//  ViewController.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/27/20.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextViewDelegate {
    
    // MARK: Subviews
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Omakase Logo"))
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Omakase"
        label.font = UIFont.bubblegumSans
        label.textColor = UIColor.omakaseBlack
        label.textAlignment = .center
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "where to eat. made simple"
        label.font = UIFont.karlaBold.withSize(18.adjustedHeight)
        label.textColor = UIColor.omakaseDarkGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var signupLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont.karlaBold.withSize(28.adjustedHeight)
        label.textColor = UIColor.omakaseBlack
        label.textAlignment = .left
        return label
    }()
    
    private lazy var signupSublabel: UILabel = {
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
        let button = RectangleButton(title: "Sign Up", color: .omakaseBeige, fontSize: 17.adjustedHeight) {
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
        
        let linkRange = NSRange(location: 17, length: 6)
        let attributedString = NSMutableAttributedString(string: "Have an account? Log in")
        let pstyle = NSMutableParagraphStyle()
        pstyle.alignment = .center
        attributedString.addAttribute(.link, value: "omakase://iosapp/login/", range: linkRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor.omakaseBlack, range: NSRange(location:0, length: 17))
        attributedString.addAttribute(.foregroundColor, value: UIColor.hyperlinkBlue, range: linkRange)
        attributedString.addAttribute(.font, value: UIFont.karlaBold.withSize(15.adjustedHeight), range: NSRange(location: 0, length: 23))
        attributedString.addAttribute(.paragraphStyle, value: pstyle, range: NSRange(location: 0, length: 23))
        
        textView.attributedText = attributedString
        return textView
    }()
    
    // MARK: Init & Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        let subviews = [
            logoImageView,
            titleLabel,
            subtitleLabel,
            signupLabel,
            signupSublabel,
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
    
    private func setConstraints() {
        let leadingOffset: CGFloat = 45.adjustedWidth
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(31.adjustedTopOffset)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200.adjustedHeight)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(197.adjustedTopOffset)
            make.centerX.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(271.adjustedTopOffset)
            make.centerX.equalToSuperview()
        }
        signupLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(437.adjustedTopOffset)
            make.leading.equalToSuperview().offset(leadingOffset)
        }
        signupSublabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(480.adjustedTopOffset)
            make.leading.equalToSuperview().offset(leadingOffset)
        }
        phoneField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(533.adjustedTopOffset)
            make.centerX.equalToSuperview()
            make.height.equalTo(50.adjustedHeight)
            make.width.equalTo(300.adjustedWidth)
        }
        orLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(591.adjustedTopOffset)
        }
        emailField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(617.adjustedTopOffset)
            make.centerX.equalToSuperview()
            make.height.equalTo(50.adjustedHeight)
            make.width.equalTo(300.adjustedWidth)
        }
        signupButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(695.adjustedTopOffset)
            make.height.equalTo(50.adjustedHeight)
            make.width.equalTo(300.adjustedWidth)
        }
        loginTextView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(761.adjustedTopOffset)
            make.width.equalToSuperview()
            make.height.equalTo(50.adjustedHeight)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: Actions
    private func signupButtonPressed() {
        print("signupButton pressed")
    }
    
    private func loginButtonPressed() {
        print("loginButton pressed")
    }
    
    // MARK: UITextViewDelegate
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        guard let components = NSURLComponents(url: URL, resolvingAgainstBaseURL: true),
              let path = components.path,
              components.host == "iosapp",
              components.scheme == "omakase" else {
            return false
        }

        if path == "/login/" {
            loginButtonPressed()
            return true
        }
        return false
    }
}


//
//  OnboardingViewController.swift
//  Omakase
//
//  Created by Hanzheng Li on 1/16/21.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    // MARK: Subviews
    
    private lazy var backgroundImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "onboardingBackground"))
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to"
        label.textColor = UIColor.omakaseGray
        label.font = UIFont.karlaRegular.withSize(24.adjustedHeight)
        label.textAlignment = .center
        return label
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
        label.text = "we choose where to eat,\nso you don't have to."
        label.font = UIFont.karlaBold.withSize(18.adjustedHeight)
        label.textColor = UIColor.omakaseDarkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var loginButton: RectangleButton = {
        let button = RectangleButton(title: "Log In", color: .clear, fontSize: 20.adjustedHeight) {
            self.loginButtonPressed()
        }
        button.layer.borderColor = UIColor.omakaseSalmon.cgColor
        button.layer.borderWidth = 2
        button.setTitleColor(.omakaseSalmon, for: .normal)
        return button
    }()
    
    private lazy var registerButton: RectangleButton = {
        let button = RectangleButton(title: "Register", color: .omakaseSalmon, fontSize: 20.adjustedHeight) {
            self.registerButtonPressed()
        }
        return button
    }()
        
    // MARK: Init & Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        let subviews = [
            backgroundImageView,
            welcomeLabel,
            titleLabel,
            subtitleLabel,
            loginButton,
            registerButton
        ]
        for subview in subviews {
            view.addSubview(subview)
        }
        setConstraints()
    }
    
    private func setConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(223.adjustedTopOffset)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(277.adjustedTopOffset)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(357.adjustedTopOffset)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(710.adjustedTopOffset)
            make.height.equalTo(60.adjustedHeight)
            make.leading.equalToSuperview().offset(27.adjustedWidth)
            make.width.equalTo(160.adjustedWidth)
        }
        registerButton.snp.makeConstraints { make in
            make.top.height.width.equalTo(loginButton)
            make.trailing.equalToSuperview().inset(27.adjustedWidth)
        }
    }
    
    // MARK: Actions
    private func registerButtonPressed() {
        navigationController?.pushViewController(LoginViewController(with: .signup), animated: true)
    }
    
    private func loginButtonPressed() {
        navigationController?.pushViewController(LoginViewController(with: .login), animated: true)
    }
}



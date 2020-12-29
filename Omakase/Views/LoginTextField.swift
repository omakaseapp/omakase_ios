//
//  LoginTextField.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/27/20.
//

import UIKit
import PhoneNumberKit

class LoginTextField: UIView {

    public enum Config {
        case phone, email
    }
    
    // MARK: Subviews
    private lazy var textField: UITextField = {
        let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(string: config == .phone ? "Phone Number" : "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.omakaseGray])
        field.keyboardType = config == .phone ? .phonePad : .emailAddress
        field.font = UIFont.karlaBold.withSize(17.adjustedHeight)
        field.textColor = .omakaseBlack
        field.backgroundColor = .clear

        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50.adjustedHeight))
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        ]
        field.inputAccessoryView = toolbar
        if config == .phone {
            field.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        }
        return field
    }()
    
    private lazy var icon: UIImageView = {
        let iconName = config == .phone ? "Phone Icon" : "Mail Icon"
        let imageView = UIImageView(image: UIImage(named: iconName))
        return imageView
    }()
    
    // MARK: Vars & Constants
    private var config: Config
    
    // MARK: Init & Layout

    init(config: Config) {
        self.config = config
        super.init(frame: .zero)
        backgroundColor = UIColor.omakaseLightGray
        layer.cornerRadius = 8.adjustedHeight
        
        let subviews = [textField, icon]
        for subview in subviews {
            self.addSubview(subview)
        }
        setConstraints()
    }
    
    private func setConstraints() {
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(22.adjustedWidth)
            make.trailing.equalToSuperview().offset(38.adjustedWidth)
            make.centerY.equalToSuperview()
        }
        icon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(20.adjustedHeight)
            make.trailing.equalToSuperview().inset(18.adjustedWidth)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !textField.isFirstResponder {
            textField.becomeFirstResponder()
        }
    }
    
    @objc private func doneButtonAction() {
        textField.resignFirstResponder()
    }
    
    @objc private func editingChanged(_ textField: UITextField) {
        let text = textField.text ?? ""
        let formattedText = PartialFormatter().formatPartial(text)
        if text != formattedText {
            textField.text = formattedText
        }
    }
    
}

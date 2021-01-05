//
//  GroupsReusableHeaderView.swift
//  Omakase
//
//  Created by Hanzheng Li on 1/4/21.
//

import UIKit

class GroupsReusableHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "GroupsReusableHeaderView"
    
    // MARK: Subviews
    
    private lazy var groupsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Groups"
        label.font = UIFont.karlaBold.withSize(36.adjustedHeight)
        label.textColor = .omakaseBlack
        label.textAlignment = .left
        return label
    }()
    
    private lazy var addGroupButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .omakaseSalmon
        button.layer.cornerRadius = 8.adjustedHeight
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 8.adjustedHeight
        
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.karlaBold.withSize(36.adjustedHeight)
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        
        button.addTarget(self, action: #selector(addGroupButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: Vars & Constants
    
    private var buttonPressedClosure: (() -> ())?
    
    // MARK: Init & Layout
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        for subview in [
            groupsTitleLabel,
            addGroupButton
        ] { addSubview(subview) }
        setConstraints()
    }
    
    private func setConstraints() {
        groupsTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24.adjustedWidth)
        }
        addGroupButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(22.adjustedWidth)
            make.height.equalTo(50.adjustedHeight)
            make.width.equalTo(70.adjustedWidth)
        }
    }
    
    public func configure(buttonPressedClosure: (() -> ())?) {
        self.buttonPressedClosure = buttonPressedClosure
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    
    @objc private func addGroupButtonPressed() {
        buttonPressedClosure?()
    }
}

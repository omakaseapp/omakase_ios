//
//  PreferencesReusableHeaderView.swift
//  Omakase
//
//  Created by Hanzheng Li on 2/7/21.
//

import UIKit

class PreferencesReusableHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "PreferencesReusableHeaderView"
    
    // MARK: Subviews
    
    private lazy var preferencesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Preferences"
        label.font = UIFont.karlaBold.withSize(36.adjustedHeight)
        label.textColor = .omakaseBlack
        label.textAlignment = .left
        return label
    }()
    
    private lazy var profilePhotoIcon: UIImageView = {
        let view = UIImageView(image: UIImage(named: "propic_han"))
        view.layer.cornerRadius = 25.adjustedHeight
        view.layer.masksToBounds = true
        return view
    }()
    
    // MARK: Vars & Constants
    
    // MARK: Init & Layout
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        for subview in [
            preferencesTitleLabel,
            profilePhotoIcon
        ] { addSubview(subview) }
        setConstraints()
    }
    
    private func setConstraints() {
        preferencesTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24.adjustedWidth)
        }
        profilePhotoIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50.adjustedHeight)
            make.trailing.equalToSuperview().inset(24.adjustedWidth)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

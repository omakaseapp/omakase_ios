//
//  PreferencesCollectionViewCell.swift
//  Omakase
//
//  Created by Hanzheng Li on 2/7/21.
//

import UIKit

class PreferenceCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PreferenceCollectionViewCell"
    
    // MARK: Subviews
    
    // preference name
    private lazy var preferenceNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.karlaBold.withSize(17.adjustedHeight)
        return label
    }()
    
    // current selected preference
    private lazy var selectedPreferencesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.karlaRegular.withSize(15.adjustedHeight)
        label.textColor = UIColor.omakaseGray
        return label
    }()
    
    private lazy var rightArrowIcon: UIImageView = {
        let view = UIImageView(image: UIImage(named: "salmonRightArrow"))
        return view
    }()
    
    private lazy var topSeparatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.omakaseLightGray
        return view
    }()
    
    private lazy var bottomSeparatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.omakaseLightGray
        return view
    }()
    
    // MARK: Vars & Constants
    
    var preferenceName: String!
    var selectedPreferences: [String]!
    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                DispatchQueue.main.async {
                    self.contentView.backgroundColor = .omakaseLightGray
                }
            } else {
                DispatchQueue.main.async {
                    self.contentView.backgroundColor = .white
                }
            }
        }
    }
    
    // MARK: Init & Layout
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = false
        
        for subview in [
            preferenceNameLabel,
            selectedPreferencesLabel,
            rightArrowIcon,
            topSeparatorLine,
            bottomSeparatorLine
        ] { contentView.addSubview(subview) }
        setConstraints()
    }
    
    private func setConstraints() {
        let leadingOffset: CGFloat = 24.adjustedWidth
        preferenceNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8.adjustedHeight)
            make.leading.equalToSuperview().offset(leadingOffset)
        }
        selectedPreferencesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(33.adjustedHeight)
            make.leading.equalToSuperview().offset(leadingOffset)
        }
        rightArrowIcon.snp.makeConstraints { make in
            make.height.width.equalTo(16.adjustedHeight)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(11.adjustedWidth)
        }
        topSeparatorLine.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.leading.equalToSuperview().offset(leadingOffset)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(contentView.snp.top)
        }
        bottomSeparatorLine.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.leading.equalToSuperview().offset(leadingOffset)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(contentView.snp.bottom)
        }
    }
    
    public func configure(preferenceName: String, selectedPreferences: [String]) {
        self.preferenceName = preferenceName
        self.selectedPreferences = selectedPreferences
        preferenceNameLabel.text = preferenceName
        selectedPreferencesLabel.text = selectedPreferences.joined(separator: ", ")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

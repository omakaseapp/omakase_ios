//
//  PreferencesSectionReusableView.swift
//  Omakase
//
//  Created by Hanzheng Li on 2/7/21.
//

import UIKit

class PreferencesSectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "PreferencesSectionReusableView"
    
    // MARK: Subviews
    
    private lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.karlaBold.withSize(17.adjustedHeight)
        label.textColor = UIColor.omakaseGray
        return label
    }()
    
    // MARK: Vars & Constants
    
    // MARK: Init & Layout
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(sectionTitleLabel)
        sectionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24.adjustedWidth)
            make.bottom.equalToSuperview().inset(10.adjustedHeight)
        }
    }
    
    public func configure(sectionTitle: String) {
        sectionTitleLabel.text = sectionTitle.uppercased()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

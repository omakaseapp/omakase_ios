//
//  GroupCollectionViewCell.swift
//  Omakase
//
//  Created by Hanzheng Li on 1/4/21.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "GroupCollectionViewCell"
    
    // MARK: Subviews
    
    // emoji
    private lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.karlaBold.withSize(32.adjustedHeight)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    // title
    private lazy var groupNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.karlaBold.withSize(24.adjustedHeight)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .omakaseBlack
        return label
    }()
    
    // member count
    private lazy var memberCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.karlaRegular
        label.textColor = .omakaseGray
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    // member profile pics
    private lazy var membersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 30.adjustedHeight, height: 30.adjustedHeight)
        layout.minimumInteritemSpacing = 3.adjustedWidth
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FriendPhotoCollectionViewCell.self, forCellWithReuseIdentifier: FriendPhotoCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        
        return collectionView
    }()
    
    // online status
    private lazy var onlineStatusBar: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: Vars & Constants
    
    private var group: Group!
    private var isOnline: Bool!
    
    // MARK: Init & Layout
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8.adjustedHeight
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 15.adjustedHeight
        layer.shadowOpacity = 0.1
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: contentView.layer.cornerRadius).cgPath

        for subview in [
            emojiLabel,
            groupNameLabel,
            memberCountLabel,
            membersCollectionView,
            onlineStatusBar
        ] { contentView.addSubview(subview) }
        setConstraints()
    }
    
    private func setConstraints() {
        let leadingOffset: CGFloat = 23.adjustedWidth
        groupNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17.adjustedHeight)
            make.leading.equalToSuperview().offset(67.adjustedWidth)
            make.trailing.equalToSuperview().inset(30.adjustedWidth)
        }
        emojiLabel.snp.makeConstraints { make in
            make.centerY.equalTo(groupNameLabel)
            make.leading.equalToSuperview().offset(leadingOffset)
            make.width.equalTo(32.adjustedWidth)
        }
        memberCountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(57.adjustedHeight)
            make.leading.equalToSuperview().offset(leadingOffset)
            make.trailing.equalTo(groupNameLabel)
        }
        membersCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(96.adjustedHeight)
            make.leading.equalToSuperview().offset(leadingOffset)
            make.height.equalTo(32.adjustedHeight)
            make.trailing.equalToSuperview().inset(15.adjustedWidth)
        }
        onlineStatusBar.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.width.equalTo(15.adjustedWidth)
        }
    }
    
    public func configure(group: Group, isOnline: Bool = false) {
        self.group = group
        self.isOnline = isOnline
        emojiLabel.text = group.emoji
        groupNameLabel.text = group.name
        let membersCount = group.members?.count ?? 0
        memberCountLabel.text = "\(membersCount) member\(membersCount > 1 ? "s" : "")"
        onlineStatusBar.backgroundColor = isOnline ? UIColor.onlineGreen : UIColor.omakaseBlack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GroupCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return group.members?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendPhotoCollectionViewCell.reuseIdentifier, for: indexPath) as! FriendPhotoCollectionViewCell
        let friend = group.members?[indexPath.row] as! Friend
        let image = UIImage(data: friend.profilePhotoData!) ?? UIImage(named: "Omakase Logo")!
        cell.configure(image: image)
        return cell
    }
    
    
}

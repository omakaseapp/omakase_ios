//
//  FriendPhotoCollectionViewCell.swift
//  Omakase
//
//  Created by Hanzheng Li on 1/5/21.
//

import UIKit

class FriendPhotoCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "FriendPhotoCollectionViewCell"
    
    // MARK: Subviews
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    // MARK: Init & Layout
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = 15.adjustedHeight
        layer.masksToBounds = true
        backgroundView = imageView
    }
    
    public func configure(image: UIImage) {
        imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

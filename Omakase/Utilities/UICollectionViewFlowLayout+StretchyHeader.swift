//
//  UICollectionViewFlowLayout+StretchyHeader.swift
//  Omakase
//
//  Created by Hanzheng Li on 1/4/21.
//

import UIKit

class UICollectionViewFlowLayoutWithStretchyHeader: UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ attributes in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                guard let collectionView = collectionView else { return }
                let contentOffsetY = collectionView.contentOffset.y
                let width = collectionView.frame.width
                if contentOffsetY < 0 {
                    let height = attributes.frame.height - contentOffsetY
                    attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
                }
            }
        })
        
        return layoutAttributes
    }
}

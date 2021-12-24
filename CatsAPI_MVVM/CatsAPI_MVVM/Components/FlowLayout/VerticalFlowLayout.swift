//
//  VerticalFlowLayout.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 24.12.2021.
//

import UIKit

class VerticalFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        minimumLineSpacing = CatConstants.Layout.spacingBottom
        
        minimumInteritemSpacing = CatConstants.Layout.minimumInteritemSpacingForSectionAt
        
        let width = itemWidth(for: UIScreen.main.bounds.width, spacing: CatConstants.Layout.spacing)
        
        itemSize = CGSize(width: width, height: width + CatConstants.Layout.heightCardDescription)
        
        sectionInset = UIEdgeInsets(top: CatConstants.Layout.spacingTop,
                                    left: CatConstants.Layout.spacingLeft,
                                    bottom: CatConstants.Layout.spacingBottom,
                                    right: CatConstants.Layout.spacingRight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let totalSpacing: CGFloat = (CatConstants.Layout.itemsInRow * CatConstants.Layout.spacingLeft + (CatConstants.Layout.itemsInRow - 1) * CatConstants.Layout.spacingRight) + CatConstants.Layout.minimumInteritemSpacingForSectionAt - CatConstants.Layout.spacing
        let finalWidth = (width - totalSpacing) / CatConstants.Layout.itemsInRow
        return floor(finalWidth)
    }
}

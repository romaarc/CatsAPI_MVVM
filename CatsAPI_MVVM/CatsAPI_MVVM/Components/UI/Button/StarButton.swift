//
//  StarButton.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 26.12.2021.
//

import UIKit.UIButton

final class StarButton: UIButton {
    convenience init(filled: Bool) {
        self.init()
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(filled ? CatConstants.Design.starFilled : CatConstants.Design.starNotFilled, for: .normal)
    }
}

//
//  UILabel+Extension.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import UIKit.UILabel

class TopAlignedLabel: UILabel {
  override func drawText(in rect: CGRect) {
    let textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
    super.drawText(in: textRect)
  }
}

//
//  Label.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 26.12.2021.
//

import UIKit.UILabel

final class Label: UILabel {
    convenience init() {
        self.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = Colors.grayTabBar
        self.font = Font.sber(ofSize: Font.Size.thirteen, weight: .regular)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.16
        
        self.attributedText = NSMutableAttributedString(string: "", attributes: [.kern: -0.08, .paragraphStyle: paragraphStyle])
        self.textAlignment = .center
    }
}

//
//  StackView.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 26.12.2021.
//

import UIKit.UIStackView

final class StackView: UIStackView {
    convenience init(alignment: Alignment) {
        self.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = alignment
        self.spacing = 0
    }
    
    convenience init(alignment: Alignment, spacing: CGFloat, axis: NSLayoutConstraint.Axis) {
        self.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.distribution = .fillEqually
        self.alignment = alignment
        self.spacing = spacing
    }
}

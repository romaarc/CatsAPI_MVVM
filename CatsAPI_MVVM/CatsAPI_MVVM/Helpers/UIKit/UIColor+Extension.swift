//
//  UIColor+Extension.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import UIKit.UIColor

extension UIColor {
    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}


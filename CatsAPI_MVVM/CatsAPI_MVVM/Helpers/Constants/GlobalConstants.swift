//
//  GlobalConstants.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import UIKit

struct GlobalConstants {
    static let initialPage = 1
    static let limit = 20
}

struct CatConstants {
    struct Layout {
        static let heightCardDescription: CGFloat = 79
        static let itemsInRow: CGFloat = 2
        
        static let spacing: CGFloat = 9
        static let spacingLeft: CGFloat = 9
        static let spacingTop: CGFloat = 9
        static let spacingBottom: CGFloat = 20
        static let spacingRight: CGFloat = 23
        static let minimumInteritemSpacingForSectionAt: CGFloat = 17
        
        static let cornerRadius: CGFloat = 8
        
        static let shadowRadius: CGFloat = 6
        static let shadowOpacity: Float = 0.4
        static let shadowOffsetWidth: CGFloat = 0
        static let shadowOffsetHeight: CGFloat = 5
    }
    
    struct Design {
        static var shadowColor = UIColor.black
        static var starFilled =  UIImage(named: "starfilled")?.withRenderingMode(.alwaysOriginal)
        static var starNotFilled =  UIImage(named: "starnotfilled")?.withRenderingMode(.alwaysOriginal)
    }
    
    struct Strings {
        static let emptyMessageDidError = "Не найдено кошек или подключитесь к сети, чтобы загрузить данные"
        static let emptyMessage = "Не найдено кошек"
    }
}

//
//  UIStackView+Extension.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 26.12.2021.
//

import UIKit
extension UIStackView {
    func addArrangedSubview(_ viev: UIView, withMargin margin: UIEdgeInsets ) {
        let containerForMargin = UIView()
        containerForMargin.addSubview(viev)
        viev.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viev.topAnchor.constraint(equalTo: containerForMargin.topAnchor, constant: margin.top ),
            viev.bottomAnchor.constraint(equalTo: containerForMargin.bottomAnchor, constant: margin.bottom ),
            viev.leftAnchor.constraint(equalTo: containerForMargin.leftAnchor, constant: margin.left),
            viev.rightAnchor.constraint(equalTo: containerForMargin.rightAnchor, constant: margin.right)
        ])
        addArrangedSubview(containerForMargin)
    }
}

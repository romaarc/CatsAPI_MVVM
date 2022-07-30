//
//  BaseView.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 25.12.2021.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {}
    func setupLayout() {}
}

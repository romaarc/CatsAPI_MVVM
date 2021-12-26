//
//  StarRatingStackView.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 26.12.2021.
//

import UIKit

class StarRatingStackView: UIStackView {
    
    private var rating: Int = 5
    var starFilled: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        spacing = 2
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draw() {
        setButtons()
    }
    
    private func setButtons() {
        guard let starFilled = starFilled else { return }
        for _ in 0..<starFilled {
            let button = StarButton(filled: true)
            setLayout(button: button)
        }
        for _ in 0..<rating - starFilled {
            let button = StarButton(filled: false)
            setLayout(button: button)
        }
    }
    
    private func setLayout(button: UIButton) {
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 25),
            button.widthAnchor.constraint(equalToConstant: 25)
        ])
        addArrangedSubview(button)
    }
}

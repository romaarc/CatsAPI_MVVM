//
//  CatDetailHeaderView.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 25.12.2021.
//

import Foundation

import UIKit

class CatDetailHeaderView: BaseView {

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = Colors.grayDetail
        return imageView
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = Colors.grayDetail.cgColor
        imageView.layer.borderWidth = 5.0
        imageView.layer.cornerRadius = 70.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let temperamentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = Font.sber(ofSize: Font.Size.twentyEight, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.02
        
        label.attributedText = NSMutableAttributedString(string: "", attributes: [.kern: 0.34, .paragraphStyle: paragraphStyle])
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = Font.sber(ofSize: Font.Size.twenty, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.02
        
        label.attributedText = NSMutableAttributedString(string: "", attributes: [.kern: 0.34, .paragraphStyle: paragraphStyle])
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setupView() {
        [backgroundImageView, avatarImageView, temperamentLabel, descriptionLabel].forEach { addSubview($0) }
    }

    override func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 254),
            
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            avatarImageView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -70),
            avatarImageView.heightAnchor.constraint(equalToConstant: 140),
            avatarImageView.widthAnchor.constraint(equalToConstant: 140),
            
            temperamentLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            temperamentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            temperamentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            temperamentLabel.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: temperamentLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        ])
    }
    
    func update(viewModel: CatDetailViewModelProtocol) {
        let cat = viewModel.cat
        temperamentLabel.text = cat.temperament
        descriptionLabel.text = cat.description
        if cat.id == "pers" {
            avatarImageView.image = UIImage(named: "Pers")!
        } else if cat.id == "mala" {
            avatarImageView.image = UIImage(named: "Malayan")!
        } else if cat.id == "ebur" {
            avatarImageView.image = UIImage(named: "EuropeanBurmese")!
        }
        
        if let image = cat.image, let catID = cat.name {
            if let urlString = image.url {
                avatarImageView.setImage(with: URL(string: urlString), catID: catID)
            }
        }
    }
}

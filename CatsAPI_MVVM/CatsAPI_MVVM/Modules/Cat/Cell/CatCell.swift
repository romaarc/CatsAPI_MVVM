//
//  CatCell.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 24.12.2021.
//

import Foundation

import UIKit

class CatCell: BaseUICollectionViewCell {
    private let catImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailViewStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = true
        label.font = Font.sber(ofSize: Font.Size.eleven, weight: .light)
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        
        label.attributedText = NSMutableAttributedString(string: "", attributes: [.kern: 0.07, .paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    private let detailViewNameLabel: TopAlignedLabel = {
        let label = TopAlignedLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = Font.sber(ofSize: Font.Size.seventeen, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.90

        label.attributedText = NSMutableAttributedString(string: "", attributes: [.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.numberOfLines = 0
        return label
    }()
    
    override func setupView() {
        [catImageView, detailView].forEach { contentView.addSubview($0) }
        [detailViewStatusLabel, detailViewNameLabel].forEach { detailView.addSubview($0) }
        setupUI()
        cornerRadius = CatConstants.Layout.cornerRadius
    }
}
    //MARK: - UI
extension CatCell {
    private func setupUI() {
        NSLayoutConstraint.activate([
            catImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            catImageView.topAnchor.constraint(equalTo: topAnchor),
            catImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            catImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -79),
            
            detailView.topAnchor.constraint(equalTo: catImageView.bottomAnchor),
            detailView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            detailViewStatusLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 12),
            detailViewStatusLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 12),
            detailViewStatusLabel.heightAnchor.constraint(equalToConstant: 13),
            detailViewStatusLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -12),
            
            detailViewNameLabel.topAnchor.constraint(equalTo: detailViewStatusLabel.bottomAnchor),
            detailViewNameLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 12),
            detailViewNameLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -12),
            detailViewNameLabel.heightAnchor.constraint(equalToConstant: 42)
                        
        ])
    }
    //MARK: - Update with ViewModel
    func update(with viewModel: CatViewModelProtocol, and indexPath: IndexPath) {
        let cat = viewModel.cat(at: indexPath.row)
        detailViewNameLabel.text = cat.name
        detailViewStatusLabel.text = cat.origin
        if let image = cat.image {
            if let urlString = image.url {
                let url = URL(string: urlString)!
                if let cachedImage = ImageCacher.shared.get(for: url) {
                    catImageView.image = cachedImage
                } else {
                    catImageView.downloaded(from: url)
                }
            }
        }
    }
}

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
    
    private let descriptionLabel: UILabel = {
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
    
    private let mainStackView: StackView = {
        let stackView = StackView(alignment: .fill,
                                  spacing: 10,
                                  axis: .vertical)
        stackView.backgroundColor = Colors.grayDetail
        return stackView
    }()
    
    private let mainFirstStackView: StackView = {
        let stackView = StackView(alignment: .center,
                                  spacing: 30,
                                  axis: .horizontal)
        return stackView
    }()
    
    private let mainSecondStackView: StackView = {
        let stackView = StackView(alignment: .center,
                                  spacing: 30,
                                  axis: .horizontal)
        return stackView
    }()
    
    private let mainThirdStackView: StackView = {
        let stackView = StackView(alignment: .center,
                                  spacing: 30,
                                  axis: .horizontal)
        return stackView
    }()
    
    private let mainFourStackView: StackView = {
        let stackView = StackView(alignment: .center,
                                  spacing: 30,
                                  axis: .horizontal)
        return stackView
    }()
    
    private let mainFifthStackView: StackView = {
        let stackView = StackView(alignment: .center,
                                  spacing: 30,
                                  axis: .horizontal)
        return stackView
    }()
    
    private let mainSixStackView: StackView = {
        let stackView = StackView(alignment: .center,
                                  spacing: 30,
                                  axis: .horizontal)
        return stackView
    }()
    
    private lazy var childFriendlyFiveStarStackView = StarRatingStackView()
    
    private let childFriendlyLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let childFriendlyStackView: StackView = {
        let stackView = StackView(alignment: .leading)
        return stackView
    }()
    
    private lazy var dogFriendlyFiveStarStackView = StarRatingStackView()
    
    private let dogFriendlyLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let dogFriendlyStackView: StackView = {
        let stackView = StackView(alignment: .trailing)
        return stackView
    }()
    
    private lazy var energyLevelFiveStarStackView = StarRatingStackView()
    
    private let energyLevelLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let energyLevelStackView: StackView = {
        let stackView = StackView(alignment: .leading)
        return stackView
    }()
    
    private lazy var healthIssuesFiveStarStackView = StarRatingStackView()
    
    private let healthIssuesLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let healthIssuesStackView: StackView = {
        let stackView = StackView(alignment: .trailing)
        return stackView
    }()
    
    private lazy var adaptabilityFiveStarStackView = StarRatingStackView()
    
    private let adaptabilityLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let adaptabilityStackView: StackView = {
        let stackView = StackView(alignment: .leading)
        return stackView
    }()
    
    private lazy var affectionLevelFiveStarStackView = StarRatingStackView()
    
    private let aaffectionLevelLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let affectionLevelStackView: StackView = {
        let stackView = StackView(alignment: .trailing)
        return stackView
    }()
    
    private lazy var groomingFiveStarStackView = StarRatingStackView()
    
    private let groomingLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let groomingStackView: StackView = {
        let stackView = StackView(alignment: .leading)
        return stackView
    }()
    
    private lazy var intelligenceFiveStarStackView = StarRatingStackView()
    
    private let intelligenceLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let intelligenceStackView: StackView = {
        let stackView = StackView(alignment: .trailing)
        return stackView
    }()
    
    private lazy var sheddingLevelFiveStarStackView = StarRatingStackView()
    
    private let sheddingLevelLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let sheddingLevelStackView: StackView = {
        let stackView = StackView(alignment: .leading)
        return stackView
    }()
    
    private lazy var socialNeedsFiveStarStackView = StarRatingStackView()
    
    private let socialNeedsLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let socialNeedsStackView: StackView = {
        let stackView = StackView(alignment: .trailing)
        return stackView
    }()
    
    private lazy var strangerFriendlyFiveStarStackView = StarRatingStackView()
    
    private let strangerFriendlyLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let strangerFriendlyStackView: StackView = {
        let stackView = StackView(alignment: .leading)
        return stackView
    }()
    
    private lazy var vocalisationFiveStarStackView = StarRatingStackView()
    
    private let vocalisationLabel: Label = {
        let label = Label()
        return label
    }()
    
    private let vocalisationStackView: StackView = {
        let stackView = StackView(alignment: .trailing)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setupView() {
        [avatarImageView, temperamentLabel, mainStackView].forEach { backgroundImageView.addSubview($0)}
        
        [backgroundImageView, descriptionLabel].forEach { addSubview($0) }

        [childFriendlyLabel, childFriendlyFiveStarStackView].forEach { childFriendlyStackView.addArrangedSubview($0) }
        
        dogFriendlyStackView.addArrangedSubview(dogFriendlyLabel, withMargin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -58))
        dogFriendlyStackView.addArrangedSubview(dogFriendlyFiveStarStackView)
        
        [energyLevelLabel, energyLevelFiveStarStackView].forEach { energyLevelStackView.addArrangedSubview($0) }
        
        healthIssuesStackView.addArrangedSubview(healthIssuesLabel, withMargin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -51.7))
        healthIssuesStackView.addArrangedSubview(healthIssuesFiveStarStackView)
        
        [adaptabilityLabel, adaptabilityFiveStarStackView].forEach { adaptabilityStackView.addArrangedSubview($0) }
        
        affectionLevelStackView.addArrangedSubview(aaffectionLevelLabel, withMargin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -45))
        affectionLevelStackView.addArrangedSubview(affectionLevelFiveStarStackView)
        
        [groomingLabel, groomingFiveStarStackView].forEach { groomingStackView.addArrangedSubview($0) }
        
        intelligenceStackView.addArrangedSubview(intelligenceLabel, withMargin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -60.7))
        intelligenceStackView.addArrangedSubview(intelligenceFiveStarStackView)
        
        [sheddingLevelLabel, sheddingLevelFiveStarStackView].forEach { sheddingLevelStackView.addArrangedSubview($0) }
        
        socialNeedsStackView.addArrangedSubview(socialNeedsLabel, withMargin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -58))
        socialNeedsStackView.addArrangedSubview(socialNeedsFiveStarStackView)
        
        [strangerFriendlyLabel, strangerFriendlyFiveStarStackView].forEach { strangerFriendlyStackView.addArrangedSubview($0) }
        
        vocalisationStackView.addArrangedSubview(vocalisationLabel, withMargin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -59))
        vocalisationStackView.addArrangedSubview(vocalisationFiveStarStackView)

        [adaptabilityStackView, affectionLevelStackView].forEach { mainFirstStackView.addArrangedSubview($0) }
        [childFriendlyStackView, dogFriendlyStackView].forEach { mainSecondStackView.addArrangedSubview($0) }
        [energyLevelStackView, healthIssuesStackView].forEach { mainThirdStackView.addArrangedSubview($0) }
        [groomingStackView, intelligenceStackView].forEach { mainFourStackView.addArrangedSubview($0) }
        [sheddingLevelStackView, socialNeedsStackView].forEach { mainFifthStackView.addArrangedSubview($0) }
        [strangerFriendlyStackView, vocalisationStackView].forEach { mainSixStackView.addArrangedSubview($0) }
        
        [mainFirstStackView, mainSecondStackView, mainThirdStackView, mainFourStackView, mainFifthStackView, mainSixStackView].forEach { mainStackView.addArrangedSubview($0) }
    }

    override func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 10),
            
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            avatarImageView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -70),
            avatarImageView.heightAnchor.constraint(equalToConstant: 140),
            avatarImageView.widthAnchor.constraint(equalToConstant: 140),
            
            temperamentLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            temperamentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            temperamentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            mainStackView.topAnchor.constraint(equalTo: temperamentLabel.bottomAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
        ])
    }
    
    func update(viewModel: CatDetailViewModelProtocol) {
        let cat = viewModel.cat
        temperamentLabel.text = cat.temperament
        descriptionLabel.text = cat.description
        
        childFriendlyFiveStarStackView.starFilled = cat.childFriendly
        childFriendlyFiveStarStackView.draw()
        childFriendlyLabel.text = "Child friendly"
        
        dogFriendlyFiveStarStackView.starFilled = cat.dogFriendly
        dogFriendlyFiveStarStackView.draw()
        dogFriendlyLabel.text = "Dog friendly"
        
        energyLevelFiveStarStackView.starFilled = cat.energyLevel
        energyLevelFiveStarStackView.draw()
        energyLevelLabel.text = "Energy level"
        
        healthIssuesFiveStarStackView.starFilled = cat.healthIssues
        healthIssuesFiveStarStackView.draw()
        healthIssuesLabel.text = "Health issues"
        
        adaptabilityFiveStarStackView.starFilled = cat.adaptability
        adaptabilityFiveStarStackView.draw()
        adaptabilityLabel.text = "Adaptability"
        
        affectionLevelFiveStarStackView.starFilled = cat.affectionLevel
        affectionLevelFiveStarStackView.draw()
        aaffectionLevelLabel.text = "Affection level"
        
        groomingFiveStarStackView.starFilled = cat.grooming
        groomingFiveStarStackView.draw()
        groomingLabel.text = "Grooming"
        
        intelligenceFiveStarStackView.starFilled = cat.intelligence
        intelligenceFiveStarStackView.draw()
        intelligenceLabel.text = "Intelligence"
        
        sheddingLevelFiveStarStackView.starFilled = cat.sheddingLevel
        sheddingLevelFiveStarStackView.draw()
        sheddingLevelLabel.text = "Shedding level"

        socialNeedsFiveStarStackView.starFilled = cat.socialNeeds
        socialNeedsFiveStarStackView.draw()
        socialNeedsLabel.text = "Social needs"
        
        strangerFriendlyFiveStarStackView.starFilled = cat.strangerFriendly
        strangerFriendlyFiveStarStackView.draw()
        strangerFriendlyLabel.text = "Stranger friendly"
        
        vocalisationFiveStarStackView.starFilled = cat.vocalisation
        vocalisationFiveStarStackView.draw()
        vocalisationLabel.text = "Vocalisation"
        
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

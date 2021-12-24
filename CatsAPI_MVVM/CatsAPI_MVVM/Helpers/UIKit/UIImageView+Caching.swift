//
//  UIImageView+Caching.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 24.12.2021.
//

import UIKit.UIImageView
import Kingfisher

extension UIImageView {
    func setImage(with url: URL?, catID: String) {
        guard let url = url else { return }
        let placeholder = UIImage(named: "default")
        let resource = ImageResource(downloadURL: url, cacheKey: catID + "_" + url.absoluteString)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: resource, placeholder: placeholder, options: [.transition(.fade(0.2))])
    }
}

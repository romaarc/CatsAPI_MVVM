//
//  UIImageView+Caching.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 24.12.2021.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.showActivity()
            }
            
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { self.hideActivity()
                return }
            DispatchQueue.main.async() {
                ImageCacher.shared.cache(image, for: url)
                self.image = image
                self.hideActivity()
            }
        }.resume()
    }
}

extension UIImageView {
    func showActivity() {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        
        addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        bringSubviewToFront(indicator)
        
        indicator.startAnimating()
    }
    
    func hideActivity() {
        DispatchQueue.main.async {
            for subview in self.subviews {
                if let indicator = subview as? UIActivityIndicatorView {
                    indicator.stopAnimating()
                    break
                }
            }
        }
    }
}

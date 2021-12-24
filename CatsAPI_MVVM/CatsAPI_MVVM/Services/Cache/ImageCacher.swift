//
//  ImageCacher.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 24.12.2021.
//

import UIKit

class ImageCacher {
    static let shared = ImageCacher()
        
    private lazy var imageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.countLimit = 200
        return cache
    }()
    
    func cache(_ image: UIImage, for key: URL) {
        self.imageCache.setObject(image, forKey: key as AnyObject)
    }
    
    func get(for key: URL) -> UIImage? {
        return imageCache.object(forKey: key as AnyObject) as? UIImage
    }
}

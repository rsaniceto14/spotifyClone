//
//  ImageCache.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 19/07/25.
//

import Foundation
import UIKit

final class ImageCache {
    static let shared = ImageCache()
    
    private init(){}
    
    private let cache = NSCache<NSURL, UIImage>()
    
    func image(for url: URL) -> UIImage? {
        return cache.object(forKey: url as NSURL)
    }
    
    func setImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
}

//
//  ImageLoader.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 19/07/25.
//

import Foundation
import UIKit
import Combine

@MainActor //executa na thread principal

final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    
    func loadImage(from url: URL) async {
        if let cached = ImageCache.shared.image(for: url) {
            self.image = cached
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let img = UIImage(data: data){
                ImageCache.shared.setImage(img, for: url)
                self.image = img
            }
        } catch {
            print("failed to load image: \(error)")
        }
    }
}

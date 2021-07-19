//
//  ImageLoaderService.swift
//  Clothes Store
//
//  Created by Kalpesh on 18/07/21.
//  Copyright © 2021 RichieHope. All rights reserved.
//

import UIKit

class ImageLoaderService: APIService {

    var cache = TemporaryImageCache.shared
    public static let shared = ImageLoaderService()

    private override init() { }

    /// Load image from url.
    /// - Parameters:
    ///   - url: URL of the image.
    ///   - completion: Result block.
    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }

        if let image = cache[url] {
            completion(image)
        }

        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let responseData = data,
                  let image = UIImage(data: responseData) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            self.cache[url] = image
            //self.imageCache[url.absoluteString] = image
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
}

extension UIImageView {

    /// Set image from url.
    /// - Parameters:
    ///   - url: URL of the image.
    ///   - defaultImage: (Optional) Default image.
    ///   - completion: (Optional) Result block.
    func setImage(url: String, defaultImage: UIImage? = nil, completion: ((UIImage?) -> Void)? = nil) {
        self.image = defaultImage
        ImageLoaderService.shared.getImage(url: url) { [weak self] (image) in
            guard let self = self else { return }
            if let image = image {
                self.image = image
            } else {
                self.image = defaultImage
            }
            completion?(image)
        }
    }

}

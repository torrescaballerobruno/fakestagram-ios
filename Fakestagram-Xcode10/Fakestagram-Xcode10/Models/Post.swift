//
//  Post.swift
//  Fakestagram-Xcode10
//
//  Created by Bruno Torres on 10/11/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation
import UIKit

struct Post: Codable {
    let id: Int?
    let title: String
    let imageUrl: String?
    var likesCount: Int
    var commentsCount: Int
    let createdAt: String
    var liked: Bool
    let location: String
    
    func likesCountText() -> String {
        return "\(likesCount) likes"
    }
    
    func commentsCountText() -> String {
        return "\(commentsCount) comments"
    }
    
    func load(_ image: @escaping (UIImage) -> Void) {
        guard let urlString = imageUrl, let url = URL(string: urlString) else { return }
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url), let img = UIImage(data: data) {
                DispatchQueue.main.async { image(img) }
            }
        }
    }
}

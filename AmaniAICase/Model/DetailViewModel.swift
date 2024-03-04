//
//  DetailViewModel.swift
//  AmaniAICase
//
//  Created by Y. Yılmaz Erdoğmuş on 4.03.2024.
//

import Foundation

class DetailViewModel {
    let image: Image
    
    init(image: Image) {
        self.image = image
    }
    
    var imageURL: URL? {
        return URL(string: image.base64)
    }
    
    var title: String {
        return image.title
    }
    
    var description: String {
        return image.description
    }
}

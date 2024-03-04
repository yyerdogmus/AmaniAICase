//
//  HomeViewModel.swift
//  AmaniAICase
//
//  Created by Y. Yılmaz Erdoğmuş on 4.03.2024.
//

import Foundation

class HomeViewModel {
    let images: [Image]
    
    init(images: [Image]) {
        self.images = images
    }
    
    var numberOfImages: Int {
        return images.count
    }
    
    func getImage(at index: Int) -> Image {
        return images[index]
    }
}

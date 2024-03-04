//
//  DataModel.swift
//  AmaniAICase
//
//  Created by Y. Yılmaz Erdoğmuş on 4.03.2024.
//

import Foundation

struct ImageData: Codable {
    var images: [Image]
}

struct Image: Codable {
    var id: Int
    var title: String
    var base64: String
    var description: String
}

//
//  DataModel.swift
//  AmaniAICase
//
//  Created by Y. Yılmaz Erdoğmuş on 4.03.2024.
//

import Foundation

struct ImageData: Codable {
    let images: [Image]
}

struct Image: Codable {
    let id: Int
    let title: String
    let base64: String
    let description: String
}

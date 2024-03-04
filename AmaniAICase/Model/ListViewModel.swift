//
//  ListViewModel.swift
//  AmaniAICase
//
//  Created by Y. Yılmaz Erdoğmuş on 4.03.2024.
//

import Foundation

class ListViewModel {
    private var imageData: ImageData?
    
    var numberOfImages: Int {
        return imageData?.images.count ?? 0
    }
    
    func getImage(at index: Int) -> Image? {
        return imageData?.images[index]
    }
    
    func fetchData(completion: @escaping (Result<Void, Error>) -> Void) {
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let imageData):
                self.imageData = imageData
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

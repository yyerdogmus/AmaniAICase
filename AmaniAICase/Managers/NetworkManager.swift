//
//  NetworkManager.swift
//  AmaniAICase
//
//  Created by Y. Yılmaz Erdoğmuş on 4.03.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(completion: @escaping (Result<ImageData, Error>) -> Void) {
        guard let url = URL(string: "https://gist.githubusercontent.com/zekierciyas/48e744272a0aad671173409211ed716c/raw/de31c073f35250fa41022dd0a8422cf60758c4e9/images") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NetworkError.unknownError))
                return
            }
            
            do {
                var imageData = try JSONDecoder().decode(ImageData.self, from: data)
                imageData.images.sort(by: { $0.id < $1.id }) // Sort images by ID
                
                completion(.success(imageData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }

}

enum NetworkError: Error {
    case invalidURL
    case unknownError
}

//
//  NetworkService.swift
//  BetterMVC
//
//  Created by Windy on 28/09/21.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    func get<T: Codable>(
        type: T.Type,
        url: Endpoint,
        completion: @escaping (Result<T, ErrorHelper>) -> ()
    ) {
        URLSession.shared.dataTask(with: url.url) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.error(error?.localizedDescription ?? "")))
                }
                return
            }
            
            guard let responseHTTP = response as? HTTPURLResponse else { return }
            guard responseHTTP.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(.statusCode(responseHTTP.statusCode)))
                }
                return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch let err {
                DispatchQueue.main.async {
                    completion(.failure(.error(err.localizedDescription)))
                }
            }
            
        }.resume()
    }
    
}

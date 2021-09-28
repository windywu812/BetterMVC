//
//  GameImplemention.swift
//  BetterMVC
//
//  Created by Windy on 28/09/21.
//

import Foundation

protocol GameProtocol {
    func getAllGames(completion: @escaping (Result<[GameModel], ErrorHelper>) -> ())
}

class GameImplemention: GameProtocol {
    
    func getAllGames(
        completion: @escaping (Result<[GameModel], ErrorHelper>) -> ()
    ) {
        NetworkService.shared.get(
            type: GameResponse.self,
            url: .getAll
        ) { result in
            switch result {
            case.success(let response):
                completion(.success(response.results))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
}

//
//  GameResponse.swift
//  BetterMVC
//
//  Created by Windy on 28/09/21.
//

struct GameResponse: Codable {
    let results: [GameModel]
}

struct GameModel: Codable {
    let id: Int
    let name: String
}

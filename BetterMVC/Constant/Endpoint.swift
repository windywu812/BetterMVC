//
//  Endpoint.swift
//  BetterMVC
//
//  Created by Windy on 28/09/21.
//

import Foundation

enum Endpoint {
    case getAll
    case getDetail(Int)
    
    var url: URL {
        switch self {
        case .getAll:
            return URL(string: "https://api.rawg.io/api/games?key=\(Constant.apiKey)")!
        case .getDetail(let int):
            return URL(string: "https://api.rawg.io/api/games/\(int)?key=\(Constant.apiKey)")!
        }
    }
}

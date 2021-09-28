//
//  ErrorHelper.swift
//  BetterMVC
//
//  Created by Windy on 28/09/21.
//

import Foundation

enum ErrorHelper: Error {
    case statusCode(Int)
    case jsonParsingError(String)
    case error(String)
    
    var errorDescription: String {
        switch self {
        case .statusCode(let int):
            return "Error with status code: \(int)"
        case .jsonParsingError(let string):
            return "Json Parsing Error \n\(string)"
        case .error(let string):
            return string
        }
    }
}

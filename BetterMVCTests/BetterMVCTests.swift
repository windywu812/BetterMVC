//
//  BetterMVCTests.swift
//  BetterMVCTests
//
//  Created by Windy on 28/09/21.
//

import XCTest
@testable import BetterMVC

class MockGameImplementation: GameProtocol {
    
    func getAllGames(
        completion: @escaping (Result<[GameModel], ErrorHelper>) -> ()
    ) {
        let games: [GameModel] = [
            GameModel(id: 1, name: "Game 1"),
            GameModel(id: 2, name: "Game 2"),
            GameModel(id: 3, name: "Game 3"),
            GameModel(id: 4, name: "Game 4"),
            GameModel(id: 5, name: "Game 5"),
        ]
        completion(.success(games))
    }
    
}

class BetterMVCTests: XCTestCase {

    func test_getAllGames_inViewDidLoad() {
        
        let expectation = expectation(description: "GetAllGames")
        
        // Given
        let sut = ViewController()
        // Propery Injection
        sut.gameImplemention = MockGameImplementation()
        
        // Check games must be empty in initial state
        XCTAssert(sut.games.count == 0, "\(sut.games.count)")
        sut.loadViewIfNeeded()
        
        // When
        sut.viewDidLoad()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Check games must not empty in viewDidLoad
            XCTAssert(sut.games.count == 5)
            XCTAssertFalse(sut.loadingIndicator.isAnimating)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 0.5)
    }

}

//
//  BetterMVCTests.swift
//  BetterMVCTests
//
//  Created by Windy on 28/09/21.
//

import XCTest
@testable import BetterMVC

class BetterMVCTests: XCTestCase {

    func test_getAllGames_inViewDidLoad() {
        
        let expectation = expectation(description: "Test Get All Games")
        
        let sut = ViewController()
        sut.loadViewIfNeeded()
        sut.getAllGames()
        
        XCTAssert(sut.games.count == 0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssert(!sut.games.isEmpty)
            XCTAssertFalse(sut.loadingIndicator.isAnimating)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }

}

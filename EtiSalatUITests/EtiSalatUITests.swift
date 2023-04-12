//
//  EtiSalatUITests.swift
//  EtiSalatUITests
//
//  Created by Mahammadsuel C on 3/14/23.
//

import XCTest

final class EtiSalatUITests: XCTestCase {
    func test_app(){
        let app = XCUIApplication()
        app.launch()
        app.buttons["licenseCheck"].tap()
        app.buttons["privecyCheck"].tap()
        app.buttons["continue"].tap()
        
        app.buttons
        testWelcomeScreen()
    }
    
    func testWelcomeScreen(){
       
       
        
        
    }

}

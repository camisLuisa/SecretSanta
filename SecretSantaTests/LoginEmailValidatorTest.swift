//
//  LoginEmailValidatorTest.swift
//  SecretSantaTests
//
//  Created by Camila Luísa on 17/02/21.
//  Copyright © 2021 Camila Luisa Farias de Lima. All rights reserved.
//

import XCTest
@testable import SecretSanta

class LoginEmailValidatorTest: XCTestCase {
    var sut: LoginEmailValidator?

    override func setUp() {
        sut = LoginEmailValidator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginEmailValidator_WhenValidEmailProvided_ShouldReturnSucess() {
        
        // Arrange
        // Act
        let isEmailValid = sut!.validation(text: "camila@gmail.com") == .success(())
        
        // Assert
        XCTAssertTrue(isEmailValid, "The validation() should have returned .SUCCESS for a valid e-mail but return .failed().")
    }
    
    func testLoginEmailValidator_WhenTooShortEmailProvided_ShouldReturnFailed() {
        //Act
        let isEmailValid = sut!.validation(text: "cams") == .failure(.tooShort)
        
        // Assert
        XCTAssertTrue(isEmailValid, "The validation() should have returned .FAILURE(.TOOSHORT) for a too short e-mail.")
    }
    
    func testLoginEmailValidator_WhenTooLongEmailProvided_ShouldReturnFailed() {
        // Act
        let isEmailValid = sut!.validation(text: "camsluisahiuhsiuahqdiquhdiuwehduwehdiewhuduiewhdeiwhdewiuh@gmail.com") == .failure(.tooLong)
        
        // Assert
        XCTAssertTrue(isEmailValid, "The validation() should have returned .FAILURE(.TOOLONG) for a too long e-mail.")
    }
    
    func testLoginEmailValidator_WhenWrongFormatEmailProvided_ShouldReturnFailed() {
       // Act
        let isEmailValid = sut!.validation(text: "camilaDgmail.com") == .failure(.invalid(.wrongFormat))
        
        // Assert
        XCTAssertTrue(isEmailValid, "The validator() should have returned .FAILURE(.INVALID(.WRONGFORMAT)) for a e-mail without @")
        
    }
}

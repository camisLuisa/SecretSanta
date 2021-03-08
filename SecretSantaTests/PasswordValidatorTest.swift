//
//  UserLoginViewControllerTests.swift
//  SecretSantaTests
//
//  Created by Camila Luísa on 25/01/21.
//  Copyright © 2021 Camila Luisa Farias de Lima. All rights reserved.
//

@testable import SecretSanta
import XCTest

class PasswordValidatorTest: XCTestCase {
    var sut: PasswordValidator?

    override func setUpWith() {
        sut = PasswordValidator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownW() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    testPasswordValidator_WhenTooShortPasswordProvided_ShouldReturnFailed() {
        //Arrange
        //Act
        
        //Assert
        
        
    }
}

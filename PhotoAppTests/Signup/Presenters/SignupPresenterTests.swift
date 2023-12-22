//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Prathap Reddy on 06/09/23.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    
    var mockSignupModelValidator: MockSignupModelValidator!
    
    var mockSignupWebservice: MockSignupWebService!
    
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate!

    override func setUp() {
        
        signupFormModel = SignupFormModel(firstName: "Prathap",
                                              lastName: "Reddy",
                                              email: "test@test.com",
                                              password: "123456789",
                                              repeatPassword: "123456789")
        
        mockSignupModelValidator = MockSignupModelValidator()
        
        mockSignupWebservice = MockSignupWebService()
        
        mockSignupViewDelegate = MockSignupViewDelegate()
        
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebservice, delegate: mockSignupViewDelegate)
    }
    
    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebservice = nil
        mockSignupViewDelegate = nil
        sut = nil
    }
    
    func testSignupPresenter_WhenInformationProvided_WillVaidateEachProperty() {
        // Arrange

        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignupModelValidator.ispasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isRepeatPasswordValidated, "Did not validate if password match")
    }

    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        
        XCTAssertTrue(mockSignupWebservice.isSignupMethodCalled, "The Signup() method was not called in the SignupWebService class")
    }
    
    func testSignupPresented_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        let expectation = expectation(description: "Expected the successful signup() method to be called")
        mockSignupViewDelegate.expectation = expectation
        
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        self.wait(for: [expectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1, "The successfull signup() method was called more than one time")
    }
    
    func testSignupPresented_WhenSignupOperationFails_ShouldCallErrorOnDelegate() {
        // Arrange
        let errorHandlerExpectation = expectation(description: "Expected the errorHanlder() method to called")
        mockSignupViewDelegate.expectation = errorHandlerExpectation
        mockSignupWebservice.shouldReturnError = true
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockSignupViewDelegate.signupError)
    }
}

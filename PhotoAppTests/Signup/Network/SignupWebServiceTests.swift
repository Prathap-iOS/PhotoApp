//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Prathap Reddy on 05/09/23.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signFormModelRequest: SignupFormRequestModel!
    
    override func setUp() {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        signFormModelRequest = SignupFormRequestModel(firstName: "Prathap", lastName: "Reddy", email: "prathap.iosdev@gmail.com", password: "12345678")
    }
    
    override func tearDown() {
        sut = nil
        signFormModelRequest = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testSignupWebService_WhenGivenSuccessfulResponse_ReturnSuccess() {
        
        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signFormModelRequest) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        
        // Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // Act
        
        sut.signup(withForm: signFormModelRequest) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containgin unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

    func testSignupWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty reuest URL string expectation")
        
        sut = SignupWebService(urlString: "")
        
        // Act
        sut.signup(withForm: signFormModelRequest) { (SignupResponseModel, error) in
            // Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(SignupResponseModel, "When an invalidRequestURLString takes place , the model response must be nil ")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenURLRequestFailes_ReturnErrorMessageDescription() {
        // Arrange
        
        let expectation = self.expectation(description: "A failed request expectation")
        let errorDescription = "A localizaed description of an error"
        MockURLProtocol.error = SignupError.failedRequest(description: errorDescription)
        
        // Act
        
        sut.signup(withForm: signFormModelRequest) { (SignupResponseModel, error) in
            // Assert
            XCTAssertEqual(error, SignupError.failedRequest(description: errorDescription), "The signup() method did not return an expected error for the Failed Request")
//            XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

}

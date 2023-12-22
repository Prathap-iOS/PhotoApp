//
//  OrderOfUnitTestsTutorialTests.swift
//  PhotoAppTests
//
//  Created by Prathap Reddy on 28/08/23.
//

import XCTest
@testable import PhotoApp

final class OrderOfUnitTestsTutorialTests: XCTestCase {
    
    override func setUp() {
        print("\n")
        print("SetUp")
    }

    override func tearDown() {
        print("Tear Down")
        print("\n")
    }
    
    func testD() {
        print("Running Test D")
//        XCTFail("Always failing unit test")
    }
    
    func testC() {
        print("Running Test C")
    }
    
    func testB() {
        print("Running Test B")
    }
    
    func testA() {
        print("Running Test A")
    }
    
    func testSignUpFormModel_WhenInformationProvided_PasswordShouldMatchRepeatPassword() {

        //Arrange - Given
        let firstName = "Prathap"
        let lastName = "Reddy"
        let email = "prathap.iosdev@gmail.com"
        let password = "123456789"
        let repeatPassword = "123456789"
        
        //Act - When
        //Result value needs to be validated - It should be a boolean value
        
        //Assert - Then
        //This wil take a decision to the value is true or false
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

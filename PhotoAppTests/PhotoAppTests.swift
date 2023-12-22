//
//  PhotoAppTests.swift
//  PhotoAppTests
//
//  Created by Prathap Reddy on 28/08/23.
//

import XCTest
@testable import PhotoApp

final class PhotoAppTests: XCTestCase {
    
    static var classInstanceCounter = 0
    
    override class func setUp() { // 1
        super.setUp()
        print("*** Class setUp() method is called")
    }
    
    override func setUpWithError() throws { // 2
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("*** Instance setUpWithError() method is called")
    }
    
    override class func tearDown() { // 6
        super.tearDown()
        print("*** Class tearDown() method is called")
    }
    
    override func tearDownWithError() throws { // 5
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("*** Instance tearDownWithError() method is called")
    }
    
    func testExample() throws { // 3
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        print("*** Test method is called")
        addTeardownBlock { // 4
            //Called when testExample() ends.
            print("*** Teardown Block is called when test method ends.")
        }
    }
    
    override func setUp() {
        PhotoAppTests.classInstanceCounter += 1
    }
    
    override func tearDown() {
        
    }
    
    func testExamle1() {
        print("Accessing class level information. Running from Instance # \(PhotoAppTests.classInstanceCounter)")
    }
    
    func testExamle2() {
        print("Accessing class level information. Running from Instance # \(PhotoAppTests.classInstanceCounter)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

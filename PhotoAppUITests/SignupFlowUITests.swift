//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Prathap Reddy on 28/08/23.
//

import XCTest

final class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        app = XCUIApplication()
        app.launchArguments = ["-skipSurvey","-debugServer"]
        app.launchEnvironment = ["singupUrl":"http://appsdeveloperblog.com/api/v2/signup-mock-services/users",
                                 "inAppPurchasesEnabled":"true",
                                 "inAppAdsEnabled":"true"]
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat Password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "The Signup button is not enabled for user interactions")
    }
    
    func testViewController_WhenInValidFormSubmitted_PresentsErrorAlertDialogue() {
        // Arrange
        firstName.tap()
        firstName.typeText("P")
        
        lastName.tap()
        lastName.typeText("R")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("123456")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        // Act
        signupButton.tap()
        
        let emailTextFieldScreenshot = email.screenshot()
        let emailTextFieldAttachment = XCTAttachment(screenshot: emailTextFieldScreenshot)
        emailTextFieldAttachment.name = "Screenshot of Email UITextField"
        emailTextFieldAttachment.lifetime = .keepAlways
        add(emailTextFieldAttachment)
        
//        let currentAppWindow = app.screenshot()
        let currentAppWindow = XCUIScreen.main.screenshot()
        let currentAppAttachement = XCTAttachment(screenshot: currentAppWindow)
        currentAppAttachement.name = "Signup page screenshot"
        currentAppAttachement.lifetime = .keepAlways
        add(currentAppAttachement)
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialogue"].waitForExistence(timeout: 1), "An Error Alert Dialogue was not presented when invalid signup form was submitted")
    }
    
    func testViewController_WhenValidFormSubmitted_PresentsSuccessAlertDialogue() {
        // Arrange
        firstName.tap()
        firstName.typeText("Prathap")
        
        lastName.tap()
        lastName.typeText("Reddy")
        
        email.tap()
        email.typeText("test@test.com")
        
        password.tap()
        password.typeText("123456789")
        
        repeatPassword.tap()
        repeatPassword.typeText("123456789")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialogue"].waitForExistence(timeout: 3), "A Success Alert Dialogue was not presented when valid signup form was submitted")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

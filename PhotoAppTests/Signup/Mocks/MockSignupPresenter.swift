//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Prathap Reddy on 06/09/23.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProrocol {
    
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidator: PhotoApp.SignupModelValidatorProtocol, webService: PhotoApp.SignupWebServiceProtocol, delegate: PhotoApp.SignupViewDelegateProtocol?) {
        // TODO:
    }
    
    func processUserSignup(formModel: PhotoApp.SignupFormModel) {
        processUserSignupCalled = true
    }
}

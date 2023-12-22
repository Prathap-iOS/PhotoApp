//
//  MockSignupModelValidator.swift
//  PhotoApp
//
//  Created by Prathap Reddy on 06/09/23.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var ispasswordValidated: Bool = false
    var isRepeatPasswordValidated: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isEmailValid(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        ispasswordValidated = true
        return ispasswordValidated
    }
    
    func isRepeatPasswordValid(repeatPassword: String) -> Bool {
        isRepeatPasswordValidated = true
        return isRepeatPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return true
    }
    
    
}

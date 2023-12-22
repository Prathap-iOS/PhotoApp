//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Prathap Reddy on 29/08/23.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isEmailValid(email: String) -> Bool {
        var returnValue = true
        return returnValue
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        return returnValue
    }
    
    func isRepeatPasswordValid(repeatPassword: String) -> Bool {
        var returnValue = true
        return returnValue
    }
    
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        
        
        return password == repeatPassword
    }
}

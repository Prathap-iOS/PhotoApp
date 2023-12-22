//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Prathap Reddy on 06/09/23.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isEmailValid(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func isRepeatPasswordValid(repeatPassword: String) -> Bool 
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}

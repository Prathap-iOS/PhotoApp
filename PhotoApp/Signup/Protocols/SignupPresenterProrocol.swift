//
//  SignupPresenterProrocol.swift
//  PhotoApp
//
//  Created by Prathap Reddy on 06/09/23.
//

import Foundation

protocol SignupPresenterProrocol {
    
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol?)
    
    func processUserSignup(formModel: SignupFormModel) 
}

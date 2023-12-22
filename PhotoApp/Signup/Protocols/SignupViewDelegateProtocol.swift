//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Prathap Reddy on 06/09/23.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    
    func successfulSignup()
    
    func errorHandler(error: SignupError)
}

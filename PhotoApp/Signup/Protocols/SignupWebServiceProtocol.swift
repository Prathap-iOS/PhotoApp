//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Prathap Reddy on 06/09/23.
//

import Foundation

protocol SignupWebServiceProtocol {
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}

//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Prathap Reddy on 05/09/23.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}

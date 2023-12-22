//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Prathap Reddy on 05/09/23.
//

import Foundation

class SignupWebService: SignupWebServiceProtocol {
    
    private var urlSession: URLSession
    
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        guard let url = URL(string: urlString) else {
            // TODO: Create a unit test to test that a specific error message is returned is URL or nil
            completionHandler(nil, SignupError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            // TODO: Write a unit test to handle and error here
            
            if let requestError = error {
                completionHandler(nil, SignupError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                // TODO: Create a unit test to handle an error here
                completionHandler(nil, SignupError.invalidResponseModel)
            }
        }
        
        dataTask.resume()
    }
    
}

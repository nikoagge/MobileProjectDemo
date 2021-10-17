//
//  NetworkClient.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 24/9/21.
//

import Foundation
import UIKit

class NetworkClient {
    static let shared = NetworkClient()
    
    func login(username: String, password: String) -> LoginResponse? {
        var loginResponse: LoginResponse?
        let url = URL(string: Path.login.rawValue)
        let urlSessionConfiguration = URLSessionConfiguration.default
        urlSessionConfiguration.httpAdditionalHeaders = ["Accept" : "application/json", "Content-Type" : "application/x-www-form-urlencoded"]
        let dispatchSemaphore = DispatchSemaphore.init(value: 0)

        let urlSession = URLSession(configuration: urlSessionConfiguration)
        guard let url = url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.encodeParameters(parameters: ["username": username, "password": password])

        urlSession.dataTask(with: urlRequest) { data, response, error in
            defer { dispatchSemaphore.signal() }
            guard error == nil, let data = data else {
                debugPrint("There was an error with the dataTask: \(error)")
                
                return
            }
            
            loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data)
        }.resume()
        
        dispatchSemaphore.wait()
        
        return loginResponse
    }
    
    func getBooks(accessToken: String) -> [BooksResponse]? {
        var booksResponse: [BooksResponse]?
        let url = URL(string: Path.books.rawValue)
        let dispatchSemaphore = DispatchSemaphore.init(value: 0)

        guard let url = url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            defer { dispatchSemaphore.signal() }
            guard error == nil, let data = data else {
                debugPrint("There was an error with the dataTask: \(error)")
                
                return
            }
            
            booksResponse = try? JSONDecoder().decode([BooksResponse].self, from: data)
        }.resume()
        
        dispatchSemaphore.wait()
        
        return booksResponse
    }
}

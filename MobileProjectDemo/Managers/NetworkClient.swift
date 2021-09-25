//
//  NetworkClient.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 24/9/21.
//

import Foundation

class NetworkClient {
    static let shared = NetworkClient()
    
    private var baseURL = "https://3nt-my.sharepoint.com/:w:/g/personal/gdementis_threenitas_com/ETxBp2g4LAZKpPRPDri5W4cBrVwfrsgEKCUuK5_SKMGAIw?rtime=w3zB8Wp_2Ug"
    private var login = "/Login"
    private var books = "/Books"
    
    func login(userName: String, password: String) -> String {
        var accessToken = ""
        var urlRequest = URLRequest(url: URL(string: "\(baseURL)\(login)")!)
        urlRequest.httpMethod = "POST"
        let bodyParameters = ["UserName": userName, "Password": password]
        let bodyParametersJSONString = bodyParameters.reduce("") { "\($0)\($1.0)=\($1.1)&" }.dropLast()
        let bodyParametersJSONData = bodyParametersJSONString.data(using: .utf8, allowLossyConversion: false)!
        urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        urlRequest.httpBody  = bodyParametersJSONData
        let _ = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let data = data {
                
//                 if let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
//                    accessToken = loginResponse.accessToken ?? "some value"
//                } else {
//                    debugPrint("Decoding error")
//                }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                try! JSONDecoder().decode(LoginResponse.self, from: data)
            } else if let error = error {
                debugPrint("HTTP request failed with \(error)")
            }
        }.resume()
        
        return accessToken
    }
}

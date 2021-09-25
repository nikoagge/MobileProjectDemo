//
//  LoginResponse.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 24/9/21.
//

import Foundation

struct LoginResponse: Codable {
    let expiresIn: Int?
    let tokenType: String?
    let refreshToken: String?
    let accessToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case expiresIn = "expires_in"
        case tokenType = "token_type"
        case refreshToken = "refresh_token"
        case accessToken = "access_token"
    }
}

//
//  BooksResponse.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 17/10/21.
//

import Foundation

struct BooksResponse: Codable {
    let id: Int?
    let title: String?
    let imageURL: String?
    let dateReleased: String?
    let pdfURL: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageURL = "img_url"
        case dateReleased = "date_released"
        case pdfURL = "pdf_url"
    }
}

//
//  PexelResponseModel.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import Foundation

struct PexelResponse: Codable {
    let page: Int
    let perPage: Int
    let photos: [Photo]
    let totalResults: Int
    let nextPage: String
    
    enum CodingKeys: String, CodingKey {
        case page, photos
        case perPage = "per_page"
        case totalResults = "total_results"
        case nextPage = "next_page"
    }
}

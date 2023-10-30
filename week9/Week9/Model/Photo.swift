//
//  PhotoModel.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import Foundation

struct Photo: Codable, Identifiable, Hashable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: Int
    let width: Int
    let height: Int
    let url: String
    let photographer: String
    let photographerUrl: String
    let photographerId: Int
    let avgColor: String
    let src: Source
    let liked: Bool
    let alt: String
    
    enum CodingKeys: String, CodingKey {
        case id, width, height, url, photographer, src, liked, alt
        case photographerUrl = "photographer_url"
        case photographerId = "photographer_id"
        case avgColor = "avg_color"
    }
}

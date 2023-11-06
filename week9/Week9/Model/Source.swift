//
//  Source.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import Foundation

struct Source: Codable {
    let original: String
    let large2x: String
    let large: String
    let medium: String
    let small: String
    let portrait: String
    let landscape: String
    let tiny: String
    
    enum CodingKeys: String, CodingKey {
        case original, large2x, large, medium, small, portrait, landscape, tiny
    }
}

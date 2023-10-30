//
//  Config.swift
//  Week9
//
//  Added by Curtis DeGidio on 10/30/23.
//  Based on code from Rebeloper - https://www.youtube.com/watch?v=IJT2WlB03D0
//

import Foundation

struct Config: Codable {
    let myApiKey: String
}

struct ConfigValues {
    static func get() -> Config {
        guard let url = Bundle.main.url(forResource: "Config", withExtension: "plist") else {
            fatalError("Config.plist does not exist in bundle.")
        }
                
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            return try decoder.decode(Config.self, from: data)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

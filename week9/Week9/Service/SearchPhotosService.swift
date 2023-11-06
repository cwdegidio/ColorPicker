//
//  SearchPhotosService.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import Foundation

class SearchPhotosService {
    enum SearchPhotosErrors: Error {
        case invalidUrl
        case requestFailed
        case invalidStatusCode
    }
    
    // WARNING! Update Config.plist key 'myApiKey' with valid Pexel API key.
    // Not having the Config.plist or the field 'myApiKey' will result in Fatal Error.
    // Having an invalid key will result in a 401 status and no results will be returned.
    //
    // See README.md for more information.
    private let apiKey = ConfigValues.get().myApiKey
    
    func fetchPhotos(searchTerm: String) async throws -> [Photo] {
        let urlString = "https://api.pexels.com/v1/search?query=\(searchTerm)&per_page=20"
        
        print("[ DEBUG ] Creating URL")
        guard let url = URL(string: urlString) else {
            throw SearchPhotosErrors.invalidUrl
        }
        
        print("[ DEBUG ] Setting up request")
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        
        print("[ DEBUG ] Fetching data...")
        let (data, response) = try await URLSession.shared.data(for: request)
        
        print("[ DEBUG ] Checking HTTP Response")
        guard let httpResponse = response as? HTTPURLResponse else {
            throw SearchPhotosErrors.requestFailed
        }
        
        print("[ DEBUG ] Checking HTTP Status Code")
        guard httpResponse.statusCode == 200 else {
            print("[ DEBUG ] HTTP Status Code: \(httpResponse.statusCode)")
            if httpResponse.statusCode == 401 {
                print("[ DEBUG ] Update Config.plist with valid Pexel API Key.")
            }
            throw SearchPhotosErrors.invalidStatusCode
        }
        
        print("[ DEBUG ] Decoding JSON")
        do {
            let searchResult = try JSONDecoder().decode(PexelResponse.self, from: data)
            return searchResult.photos
        } catch {
            print("[ DEBUG ] unknown error \(error.localizedDescription)")
            return []
        }
    }
}

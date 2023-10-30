//
//  SearchResults.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import Foundation

class SearchResults: ObservableObject, Observable {
    @Published var photos = [Photo]()
    private let searchService = SearchPhotosService()
    
    func getPhotos(searchTerm: String) async throws {
        Task { @MainActor in
            self.photos = try await searchService.fetchPhotos(searchTerm: searchTerm)
        }
    }
}

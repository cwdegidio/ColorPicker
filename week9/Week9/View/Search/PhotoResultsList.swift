//
//  PhotoResultsList.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import SwiftUI

struct PhotoResultsList: View {
    @Binding var disableSearch: Bool
    @EnvironmentObject var viewModel: SearchResults
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.photos, id: \.self) { photo in
                    NavigationLink(value: photo) {
                        ListItem(name: photo.photographer, desc: photo.alt)
                    }
                }
            }
            .navigationDestination(for: Photo.self, destination: { photo in
                PhotoDetailWithProgressBar(photo: photo, disableSearch: $disableSearch)
            })
        }
    }
}

#Preview {
    let viewModel = SearchResults()
    var photos = [Photo]()
    
    for i in (1...10) {
        let thisPhoto = Photo(id: i, width: 500, height: 600, url: "https://www.google.com", photographer: "Curtis DeGidio", photographerUrl: "https://www.google.com", photographerId: 123, avgColor: "#111111", src: Source(original: "https://www.google.com", large2x: "https://www.google.com", large: "https://www.google.com", medium: "https://www.google.com", small: "https://www.google.com", portrait: "https://www.google.com", landscape: "https://www.google.com", tiny: "https://www.google.com"), liked: true, alt: "This is a photo of a dog.")
        photos.append(thisPhoto)
    }
    
    viewModel.photos = photos
    
    return PhotoResultsList(disableSearch: .constant(true)).environment(viewModel)
}

//
//  PhotoDetailWithProgressBar.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import SwiftUI

struct PhotoDetailWithProgressBar: View {
    @State var photo: Photo
    @State private var imageData: Data?
    @State private var loadingProgress: Double = 0.0
    @State private var isLoading = false
    @Binding var disableSearch: Bool
    
    var body: some View {
        VStack {
            if loadingProgress != 1.0 {
                DataTransferProgressBar(loadingProgress: loadingProgress)
            } else if let imageData = imageData, let uiImage = UIImage(data: imageData) {
                PhotoDetailWithImage(photo: photo, uiImage: uiImage)
            } else {
                Text("Loading image...")
            }
        }
        .onAppear {
            disableSearch = true
            Task {
                await loadImage(urlString: photo.src.large)
            }
        }
        .onDisappear {
            disableSearch = false
        }
    }
    
    func loadImage(urlString: String) async {
        if let url = URL(string: urlString) {
            
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)
            
            isLoading = true
            
            do {
                let (bytes, reponse) = try await session.bytes(from: url)
                let contentLength = Double(reponse.expectedContentLength)
                
                var data = Data(capacity: Int(contentLength))
                
                for try await byte in bytes {
                    data.append(byte)
                    loadingProgress = Double(data.count) / contentLength
                    // print("[ DEBUG ] Current Progress: \(data.count) of \(contentLength)")
                    if Double(data.count) == contentLength {
                        self.imageData = data
                        return
                    }
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
            
            isLoading = false
        }
    }
}

#Preview {
    let photoUrl = "https://images.pexels.com/photos/2607544/pexels-photo-2607544.jpeg?auto=compress\u{0026}cs=tinysrgb\u{0026}h=650\u{0026}w=940"
    let photo = Photo(id: 1234, width: 500, height: 600, url: "https://www.google.com", photographer: "Curtis DeGidio", photographerUrl: "https://www.google.com", photographerId: 123, avgColor: "#111111", src: Source(original: "https://www.google.com", large2x: "https://www.google.com", large: photoUrl, medium: "https://www.google.com", small: "https://www.google.com", portrait: "https://www.google.com", landscape: "https://www.google.com", tiny: "https://www.google.com"), liked: true, alt: "This is a photo of a dog.")
    
    return PhotoDetailWithProgressBar(photo: photo, disableSearch: .constant(true))
}

//
//  PhotoDetailWithImage.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import SwiftUI

struct PhotoDetailWithImage: View {
    let photo: Photo
    let uiImage: UIImage
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "camera")
                    Text(photo.photographer)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                Text(photo.alt)
            }
            .frame(width: 320)
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 500)
                .frame(width: 320)
                .clipped()
                .border(Color.black)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

#Preview {
    let sz = CGSize(width: 200, height: 200)
    let image = UIGraphicsImageRenderer(size: sz).image { rendererContext in
        UIColor.gray.setFill()
        rendererContext.fill(CGRect(origin: .zero, size: sz))
    }
    let photoUrl = "https://images.pexels.com/photos/2607544/pexels-photo-2607544.jpeg?auto=compress\u{0026}cs=tinysrgb\u{0026}h=650\u{0026}w=940"
    let photo = Photo(id: 1234, width: 500, height: 600, url: "https://www.google.com", photographer: "Curtis DeGidio", photographerUrl: "https://www.google.com", photographerId: 123, avgColor: "#111111", src: Source(original: "https://www.google.com", large2x: "https://www.google.com", large: photoUrl, medium: "https://www.google.com", small: "https://www.google.com", portrait: "https://www.google.com", landscape: "https://www.google.com", tiny: "https://www.google.com"), liked: true, alt: "This is a photo of a dog.")
    
    return PhotoDetailWithImage(photo: photo, uiImage: image)
}

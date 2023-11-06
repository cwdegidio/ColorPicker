//
//  AppTitle.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import SwiftUI

struct AppTitle: View {
    var body: some View {
        Text("Image Browser")
            .font(.title)
            .fontWeight(.black)
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    AppTitle()
}

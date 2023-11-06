//
//  SearchField.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/29/23.
//

import SwiftUI

struct SearchField: View {
    @Binding var searchText: String
    @Binding var confirmedSearchText: String?
    var disabled: Bool
    var viewModel: SearchResults
    
    var body: some View {
        TextField("Search", text: $searchText)
            .foregroundColor(disabled ? .white : .black)
            .disabled(disabled)
            .padding(10)
            .border(.black)
            .background(disabled ? .black : .white)
            .animation(.smooth)
            .onSubmit {
                confirmedSearchText = searchText
                if let term = confirmedSearchText {
                    Task { @MainActor in
                        try await viewModel.getPhotos(searchTerm: term)
                    }
                }
            }
    }
}

#Preview {
    let viewModel = SearchResults()
    return SearchField(
                searchText: .constant("Dog"),
                confirmedSearchText: .constant("Dog"),
                disabled: true,
                viewModel: viewModel
            )
}

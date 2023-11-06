//
//  ContentView.swift
//  Week9
//
//  Created by Curtis DeGidio on 10/28/23.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @State var confirmedSearchText: String?
    @State var disableSearchField = false
    @State var photos = [Photo]()
    @ObservedObject var viewModel = SearchResults()
    
    var body: some View {
        VStack(alignment: .leading) {
            AppTitle()
            SearchField(
                searchText: $searchText,
                confirmedSearchText: $confirmedSearchText,
                disabled: disableSearchField,
                viewModel: viewModel
            )
            if viewModel.photos.count == 0 {
                NoResults()
            } else {
                PhotoResultsList(disableSearch: $disableSearchField)
                    .environment(viewModel)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    ContentView()
}






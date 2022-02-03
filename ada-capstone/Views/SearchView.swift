//
//  SearchView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 1/31/22.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @StateObject var model: TvSearchResultListViewModel = TvSearchResultListViewModel()
    @State public var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
            Text(" ")
                .searchable(text: $searchText, prompt: "Search for a series")
                .onSubmit(of: .search) {
                   
                    Task {
                            await
                            model.populateResults(searchText: searchText)
                        }
                }
                .navigationTitle("Search")
            SearchResultListView(results: model.searchResults)
            }}
        .buttonStyle(PlainButtonStyle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

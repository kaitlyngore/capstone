//
//  tvSearchResultViewModel.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/1/22.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
    class TvSearchResultListViewModel: ObservableObject {
        
        @Published var searchResults: [TvSearchResultViewModel] = []

        func populateResults(searchText: String) async {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.themoviedb.org"
            components.path = "/3/search/tv"
            let queryItemApiKey = URLQueryItem(name: "api_key", value: APIKey)

            let queryItemQuery = URLQueryItem(name: "query", value: searchText)
            
            let queryContentQuery = URLQueryItem(name: "include_adult", value: "false")

            components.queryItems = [queryItemApiKey, queryItemQuery, queryContentQuery]
//            var defaultUrl = URL(string: "https://api.themoviedb.org/3/search/tv")
            
            do {

                let searchResponse = try await callAPI<TvSearchResponse>().get(url: components.url!) { data in


                    return try? JSONDecoder().decode(TvSearchResponse.self, from: data)
                    }
                
                DispatchQueue.main.async {self.searchResults =
                searchResponse.results.map(TvSearchResultViewModel.init)
                }

            } catch {
                print(error)
            }

        }

        
    }

    struct TvSearchResultViewModel: Identifiable {
        let db = Firestore.firestore()
        
//        @Published var shows = [SavedShow]()

        private let result: Result
        
        

        init(_ result: Result) {
            self.result = result
        }

        var id: Int {
            result.id
        }

        var name: String {
            result.name
        }

        var overview: String {
            result.overview ?? ""
        }

        var poster_path: String {
            result.poster_path ?? ""
        }

        var first_air_date: String {
            result.first_air_date ?? ""
        }
        func addShow( show: SavedShow ) {
            do {
           try _ = db.collection("shows").addDocument(from: show)
        }
            catch {
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }

    }


////try to use url components
// add db add function here??

//
//  tvSearchResultViewModel.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/1/22.
//

import Foundation
import Combine
@MainActor
    class TvSearchResultListViewModel: ObservableObject {

        @Published var searchResults: [TvSearchResultViewModel] = []

        func populateResults(searchText: String) async {
            
            do {
                let searchResponse = try await callAPI<TvSearchResponse>().get(url: URL(string: "https://api.themoviedb.org/3/search/tv?api_key=\(APIKey)&language=en-US&page=1&query=\(searchText)&include_adult=false")!) { data in
                    
                    var str: String = String(data: data, encoding: .utf8)!
                    
                    
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
            result.overview
        }

        var poster_path: String {
            result.poster_path ?? ""
        }

        var first_air_date: String {
            result.first_air_date
        }


    }


////try to use url components
//@MainActor
//    class TvSearchResultListViewModel: ObservableObject {
//
//        @Published var searchResults: [TvSearchResultViewModel] = []
//
//        func populateResults(searchText: String) async {
//            var components = URLComponents()
//            components.scheme = "https"
//            components.host = "api.themoviedb.org"
//            components.path = "/3/search/tv"
//            let queryItemApiKey = URLQueryItem(name: "api_key", value: APIKey)
//
//            let queryItemQuery = URLQueryItem(name: "query", value: searchText)
//
//            components.queryItems = [queryItemApiKey, queryItemQuery]
//            var defaultUrl = URL(string: "https://api.themoviedb.org/3/search/tv")
//
//            do {
//                var finalUrl = try String(contentsOf: (components.url ?? defaultUrl)!)
//
//                let searchResponse = try await callAPI<TvSearchResponse>().get(url: URL(string: finalUrl)!) { data in
//
////                    var str: String = String(data: data, encoding: .utf8)!
//
//                    return try? JSONDecoder().decode(TvSearchResponse.self, from: data)
//                    }
//
//                DispatchQueue.main.async {self.searchResults =
//                searchResponse.results.map(TvSearchResultViewModel.init)
//                }
//
//            } catch {
//                print(error)
//            }
//
//        }
//
//    }

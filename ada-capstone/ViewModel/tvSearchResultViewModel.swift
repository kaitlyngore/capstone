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

class TvSearchResultViewModel: Identifiable, ObservableObject {
    let db = Firestore.firestore()
    //        maybe later make enum
    @Published var inDB: Bool = false
    @Published var dbID: String?
    private let result: Result
    
    
    
    init(_ result: Result) {
        self.result = result
        checkInDatabase()
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
            var _ = try db.collection("shows").addDocument(from: show) {[weak self] error in
                self?.checkInDatabase()}
        }
        catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func checkInDatabase() {
        
        db.collection("shows").whereField("tmdb_id", isEqualTo: result.id).getDocuments()
        {
            snapshot, error in
            
            if let snapshot = snapshot {
                if snapshot.count > 0
                {
                    self.inDB = true
                } else {
                    self.inDB = false
                }
            } else {
                print(error ?? "")
            }
            
        }
        
    }
    
    
    func deleteData() {
        let db = Firestore.firestore()
        
        db.collection("shows").whereField("tmdb_id", isEqualTo: result.id).getDocuments()
        {
            snapshot, error in
            if snapshot != nil {
                for document in snapshot!.documents {
                    document.reference.delete {
                        [weak self] error in
                        self?.checkInDatabase()}
                }
            }
            else {
                print(error ?? "")
            }
            
        }
        
    }
    
}


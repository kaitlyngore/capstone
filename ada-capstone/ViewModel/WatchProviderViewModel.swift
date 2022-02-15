//
//  WatchProviderViewModel.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/9/22.
//

import Foundation


@MainActor
class WatchProviderViewModel: ObservableObject {
    @Published var streamingProviders: [FlatrateItem] = []
    @Published var buyOptions: [BuyItem] = []
    @Published var link: String = ""
    
    func populateResults(tmdb_id: String) async {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/tv/\(tmdb_id)/watch/providers"
        let queryItemApiKey = URLQueryItem(name: "api_key", value: APIKey)
        
        components.queryItems = [queryItemApiKey]
        
        do {
            
            let watchProviderResponse = try await callAPI<WatchProviderResponse>().get(url: components.url!) { data in
                
                return try? JSONDecoder().decode(WatchProviderResponse.self, from: data)
            }
            
            let buyOptionsList = watchProviderResponse.results.US.buy
            self.link = watchProviderResponse.results.US.link
            
            self.streamingProviders =
            watchProviderResponse.results.US.flatrate
            
            self.buyOptions =
            buyOptionsList ?? []
        }
        catch {
            print(error)
        }
        
    }
    
    
}

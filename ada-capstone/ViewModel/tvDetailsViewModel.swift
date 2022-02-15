//
//  tvDetailsViewModel.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/3/22.
//

import Foundation

@MainActor
class TvDetailsViewModel: ObservableObject {
    @Published var number_of_seasons: Int = 0
    @Published var number_of_episodes: Int = 0
    @Published var first_air_date: String = ""
    @Published var last_air_date: String = ""
    @Published var status: String = ""
    @Published var networks: [Network] = []
    func populateResults(tmdb_id: String) async {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/tv/\(tmdb_id)"
        let queryItemApiKey = URLQueryItem(name: "api_key", value: APIKey)
    
        components.queryItems = [queryItemApiKey]
        
        do {
            
            let tvDetailsResponse = try await callAPI<TVDetails>().get(url: components.url!) { data in
                let httpData = data
                let str = String(data: httpData, encoding: .utf8)!
                
                return try? JSONDecoder().decode(TVDetails.self, from: data)
            }
            self.number_of_seasons = tvDetailsResponse.number_of_seasons
            self.first_air_date = tvDetailsResponse.first_air_date
            self.last_air_date = tvDetailsResponse.last_air_date
            self.status = tvDetailsResponse.status
            self.networks =
            tvDetailsResponse.networks
            self.number_of_episodes = tvDetailsResponse.number_of_episodes
            
            let str6 = self.number_of_episodes
        }
        catch {
            print(error)
        }
        
    }
    
    
}

//
//  WatchProviderViewModel.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/9/22.
//

import Foundation


@MainActor
class WatchProviderViewModel: ObservableObject {
//    @Published var watchProviders: [WatchProviderViewModel] = []
    @Published var streamingProviders: [FlatrateItem] = []
    @Published var buyOptions: [BuyItem] = []
    @Published var link: String = ""
//    private var flatrate: FlatrateItem
//    private var buyingitems: BuyItem
    func populateResults(tmdb_id: String) async {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/tv/\(tmdb_id)/watch/providers"
        let queryItemApiKey = URLQueryItem(name: "api_key", value: APIKey)
    
        components.queryItems = [queryItemApiKey]
        //            var defaultUrl = URL(string: "https://api.themoviedb.org/3/search/tv")
        
        do {
            
            let watchProviderResponse = try await callAPI<WatchProviderResponse>().get(url: components.url!) { data in
                let httpData = data
                let str = String(data: httpData, encoding: .utf8)!
                
                return try? JSONDecoder().decode(WatchProviderResponse.self, from: data)
            }
            
            var streamingProvidersList = watchProviderResponse.results.US.flatrate
//            let streamingService = watchProviderResponse.results.US.flatrate.provider_name
            var buyOptionsList = watchProviderResponse.results.US.buy
            self.link = watchProviderResponse.results.US.link
//            self.buyOptions = buyOptionsList
            
            self.streamingProviders =
            streamingProvidersList
            let str = self.streamingProviders
            
            self.buyOptions =
            buyOptionsList ?? []
            let str2 = self.buyOptions
        }
        catch {
            print(error)
        }
        
    }
    
    
}

class FlatrateViewModel: Identifiable, ObservableObject {
    //        maybe later make enum
    private let result: FlatrateItem
    
    
    
    init(_ result: FlatrateItem) {
        self.result = result
    }
    
    var provider_name: String {
        result.provider_name
    }
    
    var display_priority: Int {
        result.display_priority
    }
    
    var logo_path: String {
        result.logo_path ?? ""
    }
}

//class BuyItemViewModel: Identifiable, ObservableObject {
//    //        maybe later make enum
//    private let buyItem: BuyItem
//    
//    
//    
//    init(_ result: BuyItem) {
//        self.buyItem = result
//    }
//    
//    var provider_name: String {
//        buyItem.provider_name
//    }
//    
//    var display_priority: Int {
//        buyItem.display_priority
//    }
//    
//    var logo_path: String {
//        buyItem.logo_path ?? ""
//    }
//}
//class WatchProviderResponseModel: Identifiable, ObservableObject {
//    let db = Firestore.firestore()
//    //        maybe later make enum
//    private let watchProviders: WatchProviderResponse
//
//
//
//    init(_ result: WatchProviderResponse) {
//        self.watchProviders = result
//    }
//
//    var US: CountryCode {
//        providers.US
//    }
//
//    var streaming: [FlatrateItem] {
//        providers.US
//    }
//
//    var buyOptions: [BuyItem] {
//        providers.US
//    }
//}
//
//
//str    String    "{\"id\":97546,\"results\":{\"AE\":{\"link\":\"https://www.themoviedb.org/tv/97546-ted-lasso/watch?locale=AE\",\"flatrate\":[{\"display_priority\":11,\"logo_path\":\"/6uhKBfmtzFqOcLousHwZuzcrScK.jpg\",\"provider_id\":350,\"provider_name\":\"Apple TV Plus\"}]},\"AR\":{\"link\":\"https://www.themoviedb.org/tv/97546-ted-lasso/watch?locale=AR\",\"flatrate\":[{\"display_priority\":11,\"logo_path\":\"/6uhKBfmtzFqOcLousHwZuzcrScK.jpg\",\"provider_id\":350,\"provider_name\":\"Apple TV Plus\"}]},\"AT\":{\"link\":\"https://www.themoviedb.org/tv/97546-ted-lasso/watch?locale=AT\",\"flatrate\":[{\"display_priority\":11,\"logo_path\":\"/6uhKBfmtzFqOcLousHwZuzcrScK.jpg\",\"provider_id\":350,\"provider_name\":\"Apple TV Plus\"}]},\"AU\":{\"link\":\"https://www.themoviedb.org/tv/97546-ted-lasso/watch?locale=AU\",\"flatrate\":[{\"display_priority\":11,\"logo_path\":\"/6uhKBfmtzFqOcLousHwZuzcrScK.jpg\",\"provider_id\":350,\"provider_name\":\"Apple TV Plus\"}]},\"BE\":{\"link\":\"https://www.themoviedb.org/tv/97546-ted-lasso/watch?locale=BE\",\"flatrate\":[{\"display_priority\":11,\"logo_path\":\"/6uhKBfmtzFqOcLousHwZuzcrScK"...

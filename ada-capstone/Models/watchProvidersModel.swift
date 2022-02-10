//
//  WatchProviders.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/10/22.
//

import Foundation

struct WatchProviderResponse: Decodable {
    let results: Results
}

struct Results: Decodable {
    let US: CountryCode
}

struct CountryCode: Decodable {
    let link: String
    let flatrate: [FlatrateItem]
    let buy: [BuyItem]?
}

struct FlatrateItem: Decodable, Identifiable {
    let display_priority: Int
    let logo_path: String?
    let provider_name: String
    let provider_id: Int
    var id: Int{provider_id}
}

struct BuyItem: Decodable {
    let display_priority: Int
    let logo_path: String?
    let provider_name: String
}

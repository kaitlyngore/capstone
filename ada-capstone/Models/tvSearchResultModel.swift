//
//  tvSearchResultModel.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/1/22.
//

import Foundation


struct TvSearchResponse: Decodable {
    let results: [Result]
    
}

struct Result: Decodable {
    let id: Int
    let name: String
//    let overview: String
//    let poster_path: String
//    let first_air_date: String
}


//
//  tvResultModel.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/1/22.
//

import Foundation

struct TVDetails: Decodable {
    let id: Int
    let name: String
    let number_of_episodes: Int
    let number_of_seasons: Int
    let poster_path: String
    let first_air_date: String
    let seasons: [Seasons]
}

struct Seasons: Decodable {
    let episode_count: String
    let id: Int
    let name: String
    let overview: String
    let poster_path: String
    let season_number: Int
    let air_date: String
}

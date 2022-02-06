//
//  callAPI2.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/2/22.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
}

class callAPI<T: Decodable> {
//    performing on a type which is decodable - need to create those types
//
    func get(url: URL, parse: (Data) -> T?) async throws -> T {
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if (response as? HTTPURLResponse)?.statusCode != 200 {
                throw NetworkError.badRequest
            }
            
            guard let result = parse(data) else {
                print(NetworkError.decodingError)
                throw NetworkError.decodingError
                
            }
            
            return result
        }
        
    }

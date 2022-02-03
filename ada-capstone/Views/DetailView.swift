//
//  DetailView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/2/22.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let name = "name"
    let description = "description"
    let seasons = 11
    let network = "network"
    let poster_path = ""
    var body: some View {
        NavigationView {VStack(alignment: .leading, spacing: 20) {
            Image(poster_path)
            HStack {
                Text("Network: \(network)")
                Spacer()
                Text("Seasons: \(seasons)")}
            .padding()
            HStack {Text("Description: \(description)")}
            .padding()
        }
        .navigationTitle("\(name)")
        }
                
        }
    
    }
    

    

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}


//struct TVDetails: Decodable {
//    let id: Int
//    let name: String
//    let number_of_episodes: Int
//    let number_of_seasons: Int
//    let poster_path: String
//    let first_air_date: String
//    let seasons: [Seasons]
//}

//[{"name":}]

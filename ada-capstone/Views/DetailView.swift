//
//  DetailView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/2/22.
//

import Foundation
import SwiftUI

struct DetailView: View {
    var showDetails: TvSearchResultViewModel
    let description = "description"
    let seasons = 11
    let network = "network"
    let poster_path = ""
    var body: some View {
        VStack(spacing: 20) {
            
            
            HStack {
                       
                               DetailPosterImageView(posterPath: showDetails.poster_path)
                           
                   }
            
            
            
    
            
            HStack {
                Text("Network: \(network)")
                Spacer()
                Text("Seasons: \(seasons)")}
            .padding()
            HStack {Text("Description: \(showDetails.overview)")}
            .padding()
            
//            Add a button to add to show list
        }
        .navigationTitle("\(showDetails.name)")
        .onAppear {
//            make call to tv show details API using the showdetails.id as the end of the URL
        }
    }
}


//



//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}


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

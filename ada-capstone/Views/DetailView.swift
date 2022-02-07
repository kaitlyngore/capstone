//
//  DetailView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/2/22.
//

import Foundation
import SwiftUI
//
struct DetailView: View {
    var showDetails: TvSearchResultViewModel
    //    @StateObject var calltoshow: TvDetailsListViewModel = TvDetailsListViewModel()
    let seasons = 11
    let network = "network"
    let poster_path = ""
    var body: some View {
        ScrollView {
        VStack(spacing: 20) {
            
            HStack {
                
                DetailPosterImageView(posterPath: showDetails.poster_path)
                
            }
            Button(action: {
                let tmdb_id = String(showDetails.id)
                let new_show = SavedShow (name: showDetails.name, tmdb_id: tmdb_id, overview: showDetails.overview, poster_path: showDetails.poster_path, first_air_date: showDetails.first_air_date)
                showDetails.addShow(show: new_show)
                
            }) {
                HStack {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 18))
                    Text("Add to My Shows")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.indigo)
            .cornerRadius(40)
            HStack {
                Text("Network: \(network)")
                Spacer()
                Text("Seasons: 11")
                
            }
            .padding()
            HStack {Text("\(showDetails.overview)")}
            .padding()
            
            
        }
        .navigationTitle("\(showDetails.name)")
        .onAppear {
            //            Task {
            //                    await
            //                calltoshow.getResults(showId: showDetails.id)
            //                }
            //            make call to tv show details API using the showdetails.id as the end of the URL
        }}
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

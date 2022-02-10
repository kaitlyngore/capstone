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
    @ObservedObject var showDetails: TvSearchResultViewModel
    @ObservedObject var watchProviders = WatchProviderViewModel()
    //    @StateObject var calltoshow: TvDetailsListViewModel = TvDetailsListViewModel()
//    @ObservedObject var savedShows = SavedShowViewModel()
//    var in_db_check =
    let seasons = 11
//    let network = "network"
    let poster_path = ""
    var body: some View {
        ScrollView {
        VStack(spacing: 20) {
            
            HStack {
                
                DetailPosterImageView(posterPath: showDetails.poster_path)
                
            }
            if !showDetails.inDB {
            Button(action: {
//                let tmdb_id = String(showDetails.id)
                let new_show = SavedShow (name: showDetails.name, tmdb_id: showDetails.id, overview: showDetails.overview, poster_path: showDetails.poster_path, first_air_date: showDetails.first_air_date)
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
            } else {
                Button(action: {
                    
                    showDetails.deleteData()
            }) {
                HStack {
                    Image(systemName: "minus.circle")
                        .font(.system(size: 18))
                    Text("Remove From My Shows")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                }
            .padding()
            .foregroundColor(.white)
            .background(Color.indigo)
            .cornerRadius(40)
            }
            }
            VStack {
//                List(watchProviders.streamingProviders, id: \.self) {item in
//                    Text(item.provider_name)
                }
            
            HStack {
//                Text("Network: \(network)")
                Spacer()
                Text("Seasons: 11")
                
            .padding()
            HStack {Text("\(showDetails.overview)")}
            .padding()
            
            
        }
        .navigationTitle("\(showDetails.name)")
        .onAppear {
                    let tmdbId = String(showDetails.id)
            Task {
                    await
                watchProviders.populateResults(tmdb_id: tmdbId)}
            //            Task {
            //                    await
            //                calltoshow.getResults(showId: showDetails.id)
            //                }
            //            make call to tv show details API using the showdetails.id as the end of the URL
        }}
    }
}
}


//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}

//
//  SavedShowDetailView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/7/22.
//

import Foundation
import SwiftUI
//
struct SavedShowDetailView: View {
    var showDetails: SavedShow
    @ObservedObject var savedShows = SavedShowViewModel()
    @ObservedObject var watchProviders = WatchProviderViewModel()
    @ObservedObject var tvDetails = TvDetailsViewModel()
//    do a check on length of savedShows and append more columns
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                ]
    //    @StateObject var calltoshow: TvDetailsListViewModel = TvDetailsListViewModel()
    let seasons = 11
    let network = "network"
    let poster_path = ""
    var body: some View {
        ScrollView {
        VStack(spacing: 20) {
            
            HStack {
                
                DetailPosterImageView(posterPath: showDetails.poster_path!)
                VStack {
                    
                    Text("Networks:")
                        .bold()
                    ForEach(tvDetails.networks, id: \.self.id) {item in
                        Text("\(item.name)")}
                    
                    HStack{
                    Text("Seasons: ")
                            .bold()
                        Text("\(tvDetails.number_of_seasons)")
                    }
                    HStack {
                    Text("Episodes: ")
                            .bold()
                        Text("\(tvDetails.number_of_episodes)")
                    }
                    VStack{
                        Text("Years Active:")
                            .bold()
                    
                    HStack{
                        if (tvDetails.first_air_date.prefix(4) != tvDetails.last_air_date.prefix(4)) {
                        Text(tvDetails.first_air_date.prefix(4))
                        Text("-")
                            Text(tvDetails.last_air_date.prefix(4))} else {
                                Text(tvDetails.first_air_date.prefix(4))
                            }
                    }
                    }
                    Text("Status: ")
                            .bold()
                        Text("\(tvDetails.status)")
                    
                    
                    
                    
                    Button(action: {
                        savedShows.deleteData(savedShow: showDetails)
                    }) {
                        HStack {
                            Image(systemName: "minus.circle")
                                .font(.system(size: 18))
                            Text("My Shows")
                                .fontWeight(.semibold)
                                .font(.subheadline)
                        }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.indigo)
                    .cornerRadius(40)
                    }
                    
                }
            }
            .padding()
//            Button(action: {
//                savedShows.deleteData(savedShow: showDetails)
//            }) {
//                HStack {
//                    Image(systemName: "minus.circle")
//                        .font(.system(size: 18))
//                    Text("Remove From My Shows")
//                        .fontWeight(.semibold)
//                        .font(.subheadline)
//                }
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.indigo)
//            .cornerRadius(40)
//            }
//            HStack {
//                Spacer()
//                ForEach(tvDetails.networks, id: \.self.id) {item in
//                    Text("Network: \(item.name)")}
//                Spacer()
//                Text("Seasons: \(tvDetails.number_of_seasons)")
//
//            }
            HStack {
                VStack{
                Text("Now Streaming On:")
                        .font(.headline)
                Spacer()
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(watchProviders.streamingProviders, id: \.self.provider_id) {item in
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(item.logo_path ?? "")"))
                        { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 50, maxHeight: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .shadow(radius: 7)
                        }
                    placeholder: {
                        Image("placeholder_image")
                        }
//                    Text("\(item.provider_name)")}
                    }
                }
            }
            }
            
            HStack {
                Text("\(showDetails.overview ?? "")")
            }
            .padding()
            
        }
        
        .onAppear {
            let tmdbId = String(showDetails.tmdb_id)
    Task {
            await
        watchProviders.populateResults(tmdb_id: tmdbId)
        
        await tvDetails.populateResults(tmdb_id: tmdbId)
    }
            
            
//            set columns after lookup
            //            Task {
            //                    await
            //                calltoshow.getResults(showId: showDetails.id)
            //                }
            //            make call to tv show details API using the showdetails.id as the end of the URL
        }
        .navigationBarTitle("\(showDetails.name)", displayMode: .inline)
        }
        
    }
}

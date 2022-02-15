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
    let columns = [GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                   GridItem(.flexible()),]
    //    @StateObject var calltoshow: TvDetailsListViewModel = TvDetailsListViewModel()
    let seasons = 11
    let network = "network"
    let poster_path = ""
    var body: some View {
        ScrollView {
        VStack(spacing: 20) {
            
            HStack {
                
                DetailPosterImageView(posterPath: showDetails.poster_path!)
                
            }
            Button(action: {
                savedShows.deleteData(savedShow: showDetails)
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
            HStack {
                Text("Network: \(network)")
                Spacer()
                Text("Seasons: 11")
                
            }
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
        watchProviders.populateResults(tmdb_id: tmdbId)}
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

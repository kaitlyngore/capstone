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
    let columns = [GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                   GridItem(.flexible()),]
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
            
            VStack {
                
                
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
            HStack {Text("\(showDetails.overview)")
            .padding()
            }
            
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

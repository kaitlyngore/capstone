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
            HStack {
                Text("Network: \(network)")
                Spacer()
                Text("Seasons: 11")
                
            }
            .padding()
            HStack {
                Text("\(showDetails.overview ?? "")")
            }
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

//
//  HomeView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 1/31/22.
//

import Foundation
import SwiftUI



struct HomeView: View {
    @ObservedObject var savedShows = SavedShowViewModel()
    var body: some View {
        VStack{
            List(savedShows.list) {
                item in NavigationLink(destination: {
                    SavedShowDetailView(showDetails: item)
                })
                {
                    HStack(spacing: 20) {
                        VStack {
                            HStack{
                                PosterImageView(posterPath: item.poster_path!)
                                VStack{
                                    HStack{
                                        
                                        Text(item.name)
                                            .bold()
                                        Spacer()
                                    }
                                    HStack{
                                        Text(item.first_air_date!.prefix(4))
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    init() {
        savedShows.getData()
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

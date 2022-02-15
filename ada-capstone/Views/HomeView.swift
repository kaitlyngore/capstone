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
        let columns = [GridItem(.flexible()),
                       GridItem(.flexible()),
                       GridItem(.flexible())]
        ScrollView {
        VStack{
            LazyVGrid(columns: columns, spacing: 3) {
            ForEach(savedShows.list, id: \.self.id) {item in
//            List(savedShows.list) {
//                item in
                NavigationLink(destination: {
                    SavedShowDetailView(showDetails: item)
                })
                {
//                    HStack(spacing: 20) {
//                        VStack {
//                            HStack{
                    HomePosterImageView(posterPath: item.poster_path!)
//                                VStack{
//                                    HStack{
//
//                                        Text(item.name)
//                                            .bold()
//                                        Spacer()
//                                    }
//                                    HStack{
//                                        Text(item.first_air_date!.prefix(4))
//                                        Spacer()
//                                    }
//                                }
//                            }
//                        }
//                    }
                } 
            }
            }
            .padding()
        }
    }
//        .padding()
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

//
//  HomeView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 1/31/22.
//

import Foundation
import SwiftUI



struct HomeView: View {
    @ObservedObject var model = SavedShowViewModel()
    var body: some View {
        
        List(model.list) {
            item in NavigationLink(destination: {
                SearchView()
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
                    }}
                
                
                
                
            }}
//            VStack(alignment: .leading) {
//
//                VStack {
//                    VStack {
//                        HStack {
//                            Text("Recent Shows:")
//                                .frame(height: 10)
//                                .padding()
//                                .font(.title2.bold())
//
//
//                            Spacer()
//                        }
//
//            List {
//
//                Section {ForEach(shows.prefix(upTo: 4), id: \.self) { show in
//                        HStack {
//
//                        Text(show.description.capitalized)
//                        Spacer()
//                            Image(systemName: "arrow.forward.circle.fill")
//                        }}}
//
//
//                }
//
//            .listStyle(GroupedListStyle())
//                    }}
//
//
//                    HStack {
//                                            Text("All Shows:").frame(height: 10)
//                                                .padding()
//                                                .font(.title2.bold())
//
//                                            Spacer()
//                                        }
//                List {
//
//                    Section {ForEach(shows, id: \.self) { show in
//                            HStack {
//
//                            Text(show.description.capitalized)
//                            Spacer()
//                                Image(systemName: "arrow.forward.circle.fill")
//                            }
//
//                    }
//
//                }
//
//
//            }
//                .listStyle(GroupedListStyle())
//        }
    }
    init() {
        model.getData()
    }
}
        

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

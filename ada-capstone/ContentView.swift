//
//  ContentView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 1/27/22.
//

import SwiftUI

let name = "Kaitlyn"
let shows = ["Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", "Showname", ]

struct ContentView: View {
    var body: some View {
        TabView {
        NavigationView {
            
            
            HomeView()
                .navigationBarTitle("My Shows")
                                        }
        
            
        .tabItem {
                         VStack{
                            Image(systemName: "house.fill")
                            Text("Home")
                         }}
                         .tabItem {
                                          VStack{
                                             Image(systemName: "house")
                                             Text("Home")
                         }
        
    }
            SearchView()
                         .tabItem {
                             VStack{
                                 Image(systemName: "magnifyingglass")
                                 Text("Search")
                             }
                         }
                     }
        .accentColor(.indigo)
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

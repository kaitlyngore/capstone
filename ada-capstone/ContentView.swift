//
//  ContentView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 1/27/22.
//

import SwiftUI

struct ContentView: View {
    @State var showCreditsView = false
    var body: some View {
        
        TabView {
            NavigationView {
                
                
                HomeView()
                    .navigationBarTitle("My Shows")
                
                    .toolbar {
                        NavigationLink(destination: CreditsView(showCreditsView: self.$showCreditsView)){
                            Button(action: {
                                self.showCreditsView.toggle()
                            }) {
                                Text("Credits")
                                
                            }}
                        //                        end of toolbar
                    }
            }
            
            
            .tabItem {
                VStack{
                    Image(systemName: "sparkles.tv")
                    Text("My Shows")
                }}
            
            SearchView()
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
        }
        .accentColor(.indigo)
        .sheet(isPresented: $showCreditsView) {
            CreditsView(showCreditsView: self.$showCreditsView)}
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

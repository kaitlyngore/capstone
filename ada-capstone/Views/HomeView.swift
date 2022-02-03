//
//  HomeView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 1/31/22.
//

import Foundation
import SwiftUI



struct HomeView: View {
    var body: some View {
            VStack(alignment: .leading) {
                    
                VStack {
                    VStack {
                        HStack {
                            Text("Recent Shows:")
                                .frame(height: 10)
                                .padding()
                                .font(.title2.bold())
                               
                        
                            Spacer()
                        }
                  
            List {

                Section {ForEach(shows.prefix(upTo: 4), id: \.self) { show in
                        HStack {
                        
                        Text(show.description.capitalized)
                        Spacer()
                            Image(systemName: "arrow.forward.circle.fill")
                        }}}
                    
                
                }
            
            .listStyle(GroupedListStyle())
                    }}
                    

                    HStack {
                                            Text("All Shows:").frame(height: 10)
                                                .padding()
                                                .font(.title2.bold())
                    
                                            Spacer()
                                        }
                List {
    
                    Section {ForEach(shows, id: \.self) { show in
                            HStack {
                            
                            Text(show.description.capitalized)
                            Spacer()
                                Image(systemName: "arrow.forward.circle.fill")
                            }
                        
                    }
                        
                }
                        
                    
            }
                .listStyle(GroupedListStyle())
        }
    }
    
}
        

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

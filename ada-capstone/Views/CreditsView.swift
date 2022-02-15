//
//  CreditsView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/14/22.
//

import Foundation
import SwiftUI



struct CreditsView: View {
    @Binding var showCreditsView: Bool
    
    var body: some View {
        NavigationView {
            VStack{
                Image("ellipsisLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 200, maxWidth: 300, minHeight: 75)
                Text("By: Kaitlyn Gore")
                    .font(.headline)
                Spacer()
                
                Group {
                    Text("Show Data:")
                        .font(.title)
                        .fontWeight(.bold)
                    //                .tracking(2)
                    
                    Image("tmdb_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 50)
                    Text("This product uses the TMDB API but is not endorsed or certified by TMDB.")
                    Text("")
                    Text("Streaming Data:")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                    Image("JustWatchLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 50)
                    
                }
                Spacer()
                Spacer()
            }
            .navigationTitle("Credits")
            .navigationBarTitle(Text("Notifications"), displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                self.showCreditsView = false
            }){
                Text("Done").bold()
            })
        }
        
    }
}

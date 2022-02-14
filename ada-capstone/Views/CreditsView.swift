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
                
                Spacer()
                
                Text("Show Data:")
                    .font(.title)
                    .fontWeight(.bold)
                //                .tracking(2)
                
                Image("tmdb_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 300, maxHeight: 50)
                
                Text("Streaming Data:")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                Image("JustWatchLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 300, maxHeight: 50)
                Text("Thanks To:")
                    .font(.title)
                    .fontWeight(.bold)
                
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


//struct CreditsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreditsView(showCreditsView: $showCreditsView)
//    }
//}

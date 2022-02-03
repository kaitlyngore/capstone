//
//  SearchResultCellVie.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/2/22.
//

import Foundation
import SwiftUI

struct SearchResultCellView: View {

    let searchResult: TvSearchResultViewModel
//    var url = URL(string: "https://image.tmdb.org/t/p/w500\(searchResult.poster_path)")
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(searchResult.poster_path)"))
               
            
                HStack{
                    
                Text(searchResult.name)
                            .bold()
                    Spacer()
                }
                HStack{
                Text(searchResult.first_air_date.prefix(4))
            Spacer()
                }
            }
            Image(systemName: "arrow.forward.circle.fill")
                }
                
            }
        }
  


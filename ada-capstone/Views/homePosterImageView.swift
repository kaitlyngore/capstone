//
//  homePosterView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/15/22.
//

import Foundation
import SwiftUI

struct HomePosterImageView: View {
    var posterPath: String
    
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)"))
        { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth:110, maxWidth: 200, maxHeight: 500)
//                .clipShape(Rectangle())
                .clipShape(RoundedRectangle(cornerRadius: 3, style: .continuous))
                .shadow(radius: 3)
        }
    placeholder: {
        Image("placeholder_image")
    }
    }
}

//
//  imageview.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/3/22.
//

import Foundation

import SwiftUI

struct PosterImageView: View {
    var posterPath: String

    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)"))
        { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100, maxHeight: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
    placeholder: {
        Image("placeholder_image")
        }
    }
}

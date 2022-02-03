//
//  DetailPosterImagePath.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/3/22.
//

import Foundation
import SwiftUI

struct DetailPosterImageView: View {
    var posterPath: String

    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)"))
        { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 300, maxHeight: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(radius: 7)
        }
    placeholder: {
        Image("placeholder_image")
        }
    }
}
